--  Diagnostic config
vim.diagnostic.config({  
	virtual_text = {
		prefix = "●",
		spacing = 2,
	},
	signs = false, -- keep in sign column
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always", -- show source (e.g. ts_ls)
		header = "",
		prefix = "",
	},
})

-- Show floating diagnostics on hover (no click needed)
vim.o.updatetime = 250 -- faster hover updates
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, {
			focusable = false,
			scope = "cursor",
			border = "rounded",
		})
	end,
})

--  Highlight line with error/warning
vim.cmd [[
	highlight! link DiagnosticUnderlineError Error
	highlight! link DiagnosticUnderlineWarn  Warning
	highlight! link DiagnosticUnderlineHint  Hint
	highlight! link DiagnosticUnderlineInfo  Info
]]
