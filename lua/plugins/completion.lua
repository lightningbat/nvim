return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind.nvim", -- for nice icons
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets" })

			-- Jump forward
			vim.keymap.set({ "i", "s" }, "<Tab>", function()
				if luasnip.jumpable(1) then
					luasnip.jump(1)
				else
					return "<Tab>"
				end
			end, { expr = true })

			-- Jump backward
			vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					return "<S-Tab>"
				end
			end, { expr = true })

			-- Enable ghost text preview
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				experimental = {
					ghost_text = true, -- ghost preview before confirming
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					['<C-e>'] = cmp.mapping.close(), -- Close menu
					['<C-y>'] = cmp.mapping.complete(), -- manually trigger completion
				}),

				completion = {
					completeopt = "menu,menuone,noinsert",
					keyword_length = 1,
				},
				preselect = cmp.PreselectMode.Item, -- auto-select first

				sources = {
					{ name = "luasnip" }, -- multi-line snippets
					{ name = "nvim_lsp" }, -- language server completions
					{ name = "buffer" }, -- repeat patterns from file
					{ name = "path" }, -- file paths
				},
				formatting = {
					format = require("lspkind").cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					})
				}
			})
		end
	},
	{ -- LLM-assisted code/text completion
		'ggml-org/llama.vim',
		event = "InsertEnter", -- only load when typing
		init = function()
			vim.g.llama_config = {
				keymap_trigger = "<C-\\>",
				keymap_accept_full = "<M-m>",
			}
		end
	},
}
