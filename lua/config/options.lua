
-- Global Leader Key
-- The 'leader' key is a prefix for custom keybindings.
vim.g.mapleader = " " -- set to space
vim.g.maplocalleader = " " -- For buffer-local mappings

-- Basic Neovim options
local o = vim.opt
-- o.number = true                 -- Enable line numbers
o.relativenumber = true
o.tabstop = 4                   -- Number of spaces a tab represents
o.shiftwidth = 4                -- Number of spaces for each indentation
--o.expandtab = true              -- Convert tabs to spaces	
o.wrap = false                  -- Disable line wrapping
o.cursorline = true             -- Highlight the current line
o.termguicolors = true          -- Enable 24-bit RGB colors
o.whichwrap = 'b,s,<,>,[,],h,l' -- Enable cursor wrap
o.synmaxcol = 200               -- Only highlight first 200 columns
o.splitright = true             -- Open vertical splits to the right
o.splitbelow = true             -- Open horizontal splits below

-- Tree-sitter folding
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- Start with folds open unless restored from mkview
o.foldlevel = 99
o.foldlevelstart = 99
-- Store folds in view files
o.viewoptions:append("folds")
o.viewoptions:remove("options") -- avoids saving unrelated global options
