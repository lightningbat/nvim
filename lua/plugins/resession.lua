return {
	{ -- Session manager
		'stevearc/resession.nvim',
		config = function()
			local resession = require("resession")
			resession.setup({})
			vim.keymap.set("n", "<leader>ss", resession.save)
			vim.keymap.set("n", "<leader>sl", resession.load)
			vim.keymap.set("n", "<leader>sd", resession.delete)
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					-- Don't load session if using stdin
					if vim.g.using_stdin then return end

					local first_arg = vim.fn.argv(0)

					-- Only load the session if nvim was started with no arguments OR with a directory as the first argument
					if vim.fn.argc(-1) == 0 or (vim.fn.argc(-1) == 1 and vim.fn.isdirectory(first_arg) == 1) then
						-- Save these to a different directory, so our manual sessions don't get polluted
						resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
					end
				end,
				nested = true,
			})
			vim.api.nvim_create_autocmd("BufAdd", {
				callback = function()
					resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = true })
				end,
			})
			vim.api.nvim_create_autocmd("VimLeavePre", {
				callback = function()
					resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
				end,
			})
			vim.api.nvim_create_autocmd('StdinReadPre', {
				callback = function()
					-- Store this for later
					vim.g.using_stdin = true
				end,
			})
		end,
	},
}
