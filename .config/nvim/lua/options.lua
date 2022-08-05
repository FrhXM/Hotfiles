      -- variables
local set = vim.opt

      -- numbers
set.number = true
set.relativenumber = true
set.numberwidth = 6

      -- Better editing experience
set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = -1 -- If negative, shiftwidth value is used
set.wrap = false
set.autoindent = true
set.cindent = true
set.list = true
set.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
set.clipboard = 'unnamedplus'

      -- search
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

      -- Better buffer splitting
set.splitbelow = true
set.splitright = true
set.hidden = true

     -- Cursor & Mouse
set.cursorline = true
set.colorcolumn = "80"
set.scrolloff = 5
set.mouse = "a"

-- Undo and backup options
set.backup = false
set.writebackup = false
set.undofile = true
set.swapfile = false
-- set.backupdir = '/tmp/'
-- set.directory = '/tmp/'
-- set.undodir = '/tmp/'

set.termguicolors = true

