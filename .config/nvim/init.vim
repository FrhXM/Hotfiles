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
"      You are about to experience a potent
"        dosage of Vim. Watch your steps.
"
"  ╔══════════════════════════════════════════╗
"  ║             HERE BE VIMPIRES             ║
"  ╚══════════════════════════════════════════╝
" +--------------+
" | Set  options |
" +--------------+
set noswapfile              " disable swapfile
set nobackup                " disable backups
set nowrap                  " wrap lines
set noshowmode              " don't show mode as we use a status line plugin
set nocursorcolumn	        " cursor in coulmn
set cursorline              " Show cursor line
set colorcolumn=80          " Line in Coulmn (80<=Caractère <=120)
set signcolumn=yes          " always show signcolumns
set number                  " show Number Line
set relativenumber          " show RelativeNumber
set numberwidth=5           " width of Number Line
set hidden                  " Overwrite buffers 
set mouse=a          	    " Active la souris, dans tous les modes 
set undofile                " save undo chages even after computer restart
set ttyfast                 " always assume a fast terminal
set showtabline=2           " Show vim tab line even if only one file is open
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

" +-----------------+
" |  Arrow Keys     |
" +-----------------+
" ==================== Disable arrow keys for normal mode =============
noremap <up> <Nop>
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
" ==================== Disable arrow keys for insert mode  =============
inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
" ==================== Disable arrow keys for visual mode  =============
vnoremap <up> <Nop>
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
" =================== Disable arrow keys for command mode ==============
cnoremap <up> <Nop>
cnoremap <down> <Nop>
cnoremap <left> <Nop>
cnoremap <right> <Nop>

" +-----------------+
" | general mapping |
" +-----------------+
" ============ Toggle the highlighting or clear the highlight =========
noremap <silent> <leader>hl :set hlsearch!<CR>
noremap <silent> <SPACE> :noh<CR>

" ============== Move the current line up or down =====================
noremap <silent> <C-k> :move -2<CR>
noremap <silent> <C-j> :move +1<CR>

"=========== Center-, right-, or left-align one or more lines. ========
noremap <silent> <leader>c :center<CR>
noremap <silent> <leader>r :right<CR>
noremap <silent> <leader>l :left<CR>

" ============================= Tabs ===================================
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <C-e> :tabnew<CR>
nnoremap <C-x> :tabclose<CR>

" ===================== Normal mode remappings ========================
nnoremap <C-q> :q!<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-b> :bd<CR>

" +----------------+
" | install plugin |
" +----------------+
call plug#begin('~/.config/nvim/plugins')
        " --- Appearance ---"
  Plug 'tiagovla/tokyodark.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'sheerun/vim-polyglot'
  Plug 'ryanoasis/vim-devicons'

       " --- Programming ---"
  Plug 'mattn/emmet-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'lilydjwg/colorizer'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'

       " ----- Tools -----"
  Plug 'junegunn/fzf.vim'
  Plug 'preservim/nerdtree'
call plug#end()

" +----------------+
" | Settings plugin |
" +----------------+
" ============================== Theme =================================
let g:tokyodark_transparent_background = 0    " set to enable transparent background.
let g:tokyodark_enable_italic_comment = 1     " Set to enable italic in Comment
let g:tokyodark_enable_italic = 1             " Set to italicize keywords. This option is designed to use with fonts that support italic styles,
let g:tokyodark_color_gamma = "1.0"           " Change to adjust the brightness of the theme. (Darker < 1.0 < Lighter).
colorscheme tokyodark
" Status Line 
lua << END
require('lualine').setup()
END
" enable transparent terminal bg
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" ============================ Emmet ===================================
let g:user_emmet_mode='a'
let g:user_emmet_leader_key=','

" ============================ Fzf =====================================
nnoremap <C-f> :Files<CR>
nnoremap <C-p> :BLines<CR>
nnoremap <C-g> :GFiles<CR>

" ========================= NERDTree ==================================
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-g> :NERDTreeFind<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

