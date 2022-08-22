-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------
-- Variable 
local set = vim.opt

-- Indenting
set.expandtab     = true
set.shiftwidth    = 4
set.smartindent   = true
set.autoindent    = true
set.wrap          = false
set.tabstop       = 4
set.softtabstop   = 4

-- numbers
set.number 	      = true
set.relativenumber= true
set.numberwidth   = 5
set.ruler 	      = false

-- cursor 
set.cursorline    = true
set.colorcolumn   = "80"
set.signcolumn	  = "yes"
set.scrolloff     = 8
set.mouse 	      = "a"

-- search
set.hlsearch 	  = true
set.incsearch     = true
set.ignorecase    = true
set.smartcase     = true

-- Undo and backup options
set.backup        = false
set.writebackup   = false
set.swapfile      = false
set.undofile 	  = true

-- buffers && Window && Split
set.hidden	      = true
set.splitbelow	  = true
set.splitright	  = true
set.timeoutlen 	  = 400

-- Others
set.termguicolors = true
set.showmode      = false
set.wildmenu 	  = true
set.completeopt   = "menuone,noselect"
set.clipboard 	  = "unnamedplus"
