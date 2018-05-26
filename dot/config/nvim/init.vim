call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'plasticboy/vim-markdown'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/rainbow_parentheses.vim'
Plug 'arecarn/crunch.vim'
Plug 'pboettch/vim-cmake-syntax'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

Plug 'spolu/dwm.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'rhysd/vim-clang-format'

call plug#end()

let g:doxygen_enhanced_color=1
let g:load_doxygen_syntax=1

set expandtab
set shiftwidth=2
set lcs=trail:·,tab:»·
set list
set cursorline
set number

set spell spelllang=en_us
set spellcapcheck=""

set signcolumn=yes

let g:ycm_confirm_extra_conf = 0

let g:airline_powerline_fonts=1
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

set background=dark
let g:gruvbox_contrast_light="hard"
let g:gruvbox_italic=1
let g:gruvbox_invert_signs=0
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

let g:vim_indent_guides_start_level = 2

set laststatus=2

set termguicolors

au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set backup
