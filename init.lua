local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable", -- latest stable release
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("config.autocmds")
require("config.commands")
require("config.options") -- need to load before keymaps
require("config.keymaps")
require("config.lsp_diagnostic")
require("config.lsp_utils")

require("lazy").setup(
	"plugins",
	{
		-- General options for lazy.nvim
		checker = { enabled = true },		  -- Check for plugin updates periodically
		install = { colorscheme = { "habamax" } }, -- Colorscheme to use during installation
		performance = {
			rtp = {
				-- Disable some default Neovim plugins for better performance
				disabled_plugins = {
					"gzip",
					"matchit",
					"matchparen",
					"netrwPlugin", -- often replaced by NvimTree or similar
					"tarPlugin",
					"tohtml",
					"tutor",
					"zipPlugin",
				},
			},
		},
		rocks = {
			hererocks = false,
		},
	}
)
