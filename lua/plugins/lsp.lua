return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" }, -- lazy-load on buffer open

		config = function()
			local lspconfig = require('lspconfig')
			local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(_, bufnr)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = 'go to previous diagnostic' })
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = 'Go to next diagnostic' })
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to Definition' })
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Go to Declaration' })
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = 'Find References' })
				vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'Go to Implementation' })
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover Documentation' })
				vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename Symbol' })
				vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code Action' })
				vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { buffer = bufnr, desc = 'Format Buffer' })
			end

			-- PYTHON
			lspconfig.pyright.setup({
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- GO
			lspconfig.gopls.setup({
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- LUA
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- JS / TS / JSX / TSX
			lspconfig.ts_ls.setup({
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- HTML
			lspconfig.html.setup({
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- STYLESHEET
			lspconfig.cssls.setup({
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- JSON
			lspconfig.jsonls.setup({
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- MARKDOWN
			lspconfig.marksman.setup({
				cmd = { vim.fn.expand("~/.local/bin/marksman-linux-x64") },
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- ESLINT
			lspconfig.eslint.setup({
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- HTML EMMET
			lspconfig.emmet_language_server.setup({})
		end,
	},
}
