""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""" Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"          ███████████████████████████
"          ███████▀▀▀░░░░░░░▀▀▀███████
"          ████▀░░░░░░░░░░░░░░░░░▀████
"          ███│░░░░░░░░░░░░░░░░░░░│███
"          ██▌│░░░░░░░░░░░░░░░░░░░│▐██
"          ██░└┐░░░░░░░░░░░░░░░░░┌┘░██
"          ██░░└┐░░░░░░░░░░░░░░░┌┘░░██
"          ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██
"          ██▌░│██████▌░░░▐██████│░▐██
"          ███░│▐███▀▀░░▄░░▀▀███▌│░███
"          ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██
"          ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██
"          ████▄─┘██▌░░░░░░░▐██└─▄████
"          █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████
"          ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████
"          █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████
"          ███████▄░░░░░░░░░░░▄███████
"          ██████████▄▄▄▄▄▄▄██████████
"          ███████████████████████████
"   
set noswapfile              " disable swapfile
set nobackup                " disable backups
set nowrap                  " wrap lines
set noshowmode              " don't show mode as we use a status line plugin
set cursorline              " Show cursor line
set colorcolumn=80          " Line in Coulmn (80<=Caractère <=120)
set signcolumn=yes          " always show signcolumns
set number                  " show Number Line
set relativenumber          " show RelativeNumber
set numberwidth=5           " width of Number Line
set hidden                  " Overwrite buffers 
set mouse=a          	    " Activate the mouse, in all modes
set undofile                " save undo chages even after computer restart
set clipboard+=unnamedplus  " use Clipboard To copy & paste To Vim

set ignorecase              " make searching case insensitive
set smartcase               " unless the query has capital letters
set hlsearch                " highlights the string matched by the search

set autoindent              " Auto-indentation des nouvelles lignes
set expandtab               " convert tabs to the spaces
set tabstop=4               " is effectively how many columns of whitespace a \t is worth.
set softtabstop=4           " is how many columns of whitespace a tab keypress or a 
set shiftwidth=4            " is how many columns of whitespace a “level of indentation” is worth.

set wildmenu                " visual autocomplete for command menu
set laststatus=2            " use Status To show informations
set background=dark         " dark colorscheme

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" download and install vim-plug if not installed  [Automatic installation]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""""""""""""""""""""""""""""""""""""""
"""" Plugine
"""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
	"   Appearance  "
Plug 'tiagovla/tokyodark.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
	"   Tools  " 
Plug 'junegunn/fzf.vim'   | Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround' | Plug 'tpope/vim-commentary' 
	" Programming "
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'lilydjwg/colorizer'
Plug 'jiangmiao/auto-pairs'
call plug#end()

"""""""""""""""""""""""""""""""""""""
"""" colorScheme
"""""""""""""""""""""""""""""""""""""
let g:tokyodark_transparent_background = 0 		" set to enable transparent background.
let g:tokyodark_enable_italic_comment = 1 		" Set to enable italic in Comment .
let g:tokyodark_enable_italic = 1				" Set to italicize keywords. This option is designed to use with fonts that support italic styles.
let g:tokyodark_color_gamma = "1.0"			    " Change to adjust the brightness of the theme. (Darker < 1.0 < Lighter).
colorscheme tokyodark
" enable transparent terminal bg
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

""""""""""""""""""""""""""""""""""""""""
"""" Fzf 
""""""""""""""""""""""""""""""""""""""""
nnoremap <C-f> :Files<CR>
nnoremap <C-w> :BLines<CR>
nnoremap <C-g> :GFiles<CR>

"""""""""""""""""""""""""""""""""""""""
""""" emmet shortcuts
"""""""""""""""""""""""""""""""""""""""
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" Plguins require lu Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.config/nvim/plugins.vim
