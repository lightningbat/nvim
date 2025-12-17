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
