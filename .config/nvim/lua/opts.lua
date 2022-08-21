-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------
-- Variable 
local set = vim.opt

-- Indenting
set.expandtab     = true
set.shiftwidth    = 2
set.smartindent   = true
set.autoindent    = true
set.wrap          = false
set.tabstop       = 2
set.softtabstop   = 2

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
set.hlsearch 	    = true
set.incsearch     = true
set.ignorecase    = true
set.smartcase     = true

-- backup & swap && Undo
set.backup        = false
set.swapfile      = false
set.undofile 	    = true

-- buffers && Window && Split
set.hidden	      = true
set.splitbelow	  = true
set.splitright	  = true
set.termguicolors = true
set.timeoutlen 	  = 400

-- Others
set.wildmenu 	    = true
set.completeopt   = "menuone,noselect"
set.clipboard 	  = "unnamedplus"
