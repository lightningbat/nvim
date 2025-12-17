return {
	{ -- Fuzzy finder
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require('telescope.builtin')

			-- Custom command to find files while ignoring specific folders
			vim.keymap.set('n', '<leader>ff', function()
				builtin.find_files({
					file_ignore_patterns = { "node_modules", ".git/", "/build/" },
					hidden = true,
					no_ignore = true
				})
			end, { desc = 'Find files' })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
		end
	},
}
