return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gs = require("gitsigns")

					local function map(mode, l, r, desc)
						vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
					end

					-- Navigation
					map("n", "]c", function() gs.next_hunk() end, "Next Hunk")
					map("n", "[c", function() gs.prev_hunk() end, "Previous Hunk")

					-- Actions
					map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
					map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
					map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage Hunk")
					map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset Hunk")
					map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
					map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
					map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
					map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
					map("n", "<leader>hD", function() gs.diffthis() vim.cmd("wincmd p") --[[ auto switch cursor to diff window ]] end, "Git Diff")
					map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line")
				end,
			})
		end,
	},
}
