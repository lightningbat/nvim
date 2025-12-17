return {
	{ -- TreeSitter (requires c compiler for languages)
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {"vim", "lua", "javascript", "go", "python"},
				sync_install = false,
				auto_install= false,
				highlight = { 
					enable = true, 
					additional_vim_regex_highlighting = false,
					disable = function(lang, buf)
						local max_file_size = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_file_size then
							return true
						end
					end,
				},
			})
		end,
	},
}
