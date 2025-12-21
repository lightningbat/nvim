-- Auto-save and auto-restore folds for every file
vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "?*",
	callback = function()
		-- Only save for normal files
		if vim.bo.buftype == "" then
			pcall(vim.cmd, "silent! mkview")
		end
	end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "?*",
	callback = function()
		if vim.bo.buftype == "" then
			pcall(vim.cmd, "silent! loadview")
		end
	end,
})

-- Disable syntax higlight for large files
local max_highlightable_file_size = 100 * 1024 -- 100 KB
vim.api.nvim_create_autocmd("BufReadPre", {
	callback = function(args)
		local ok, stats = pcall(vim.loop.fs_stat, args.file)
		if ok and stats and stats.size > max_highlightable_file_size then
			vim.cmd("syntax off") -- disable regex
		end
	end,
})

-- NOTE: Neovim 0.11.x has a startup ordering issue where calling
-- vim.lsp.enable() too early can break Tree-sitter/syntax highlighting
-- for the initial buffer. Delaying LSP enable until VimEnter avoids
-- this race. Remove once upstream fixes the issue.
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.lsp.enable({
		"pyright",
		"gopls",
		"lua_ls",
		"ts_ls",
		"html",
		"cssls",
		"jsonls",
		"marksman",
		"eslint",
		"emmet_language_server",
	})
  end,
})
