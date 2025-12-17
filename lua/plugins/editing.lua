return {
	{ -- Auto Pair
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{ -- Surround (wrapper)
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	{ -- Indention marker
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		opts = {},
	},
	{ -- Comment toggle
		'numToStr/Comment.nvim',
	},
	{ -- Bracket pair highlighter
		"andymass/vim-matchup",
	},
	{ -- html emmet extension
		"olrtg/nvim-emmet",
		config = function()
			vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
		end,
	},
	{ -- html auottag and autorename
		'windwp/nvim-ts-autotag',
		config = function()
			require('nvim-ts-autotag').setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					-- enable_close_on_slash = false -- Auto close on trailing </
				},
			})
		end
	},
	{ -- Code Block Manipulation: Splitting & Joining
		'Wansmer/treesj',
		keys = { '<space>m', '<space>j', '<space>s' },
		dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
		config = function()
			require('treesj').setup({
				max_join_length = 200,
			})
		end,
	},
	{ -- Search-Based Navigation & Advanced Motion
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
			-- { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
			{ "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
			{ "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
		},
	},
	{ -- read or write files with sudo command
		"lambdalisue/vim-suda"
	}
}
