return {
	{ -- File Explorer
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false, -- Load this plugin immediately on startup
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- For file icons (requires Nerd Font)
		},
		config = function()
			require("nvim-tree").setup({

				on_attach = function(bufnr)
					local api = require("nvim-tree.api")

					-- Load default mappings
					api.config.mappings.default_on_attach(bufnr)

					vim.keymap.set('n', 't', function()
						api.fs.trash()
					end, { desc = "Move to Trash", buffer = bufnr, noremap = true, silent = true })
				end,

				sort_by = "case_sensitive",
				hijack_cursor = true,
				view = {
					side = "left",
					width = 30,
					preserve_window_proportions = true,
					float = {
						enable = true,
						open_win_config = {
							width = 50,
							height = 50,
						}
					}
				},
				renderer = {
					group_empty = true,
					indent_markers = {
						enable = true,
						inline_arrows = false
					},
					icons = {
						git_placement = "signcolumn",
					},
				},
				filters = {
					dotfiles = false, -- Show hidden files
					git_ignored = false, -- Show files ignored by .gitignore
					custom = {
						"^.git$",
						"^.vscode$",
					}
				},
				actions = {
					open_file = {
						resize_window = true, -- Auto-resize window after opening file
					},
				},
				trash = {
					cmd = "trash-put",
				},
			})
		end,
	},
	{ -- Pane(window) maximizer
		"szw/vim-maximizer"
	},
	{ -- Status line
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "onedark",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { { "filename", path = 1 } },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { { "filename", path = 1 } },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
}
