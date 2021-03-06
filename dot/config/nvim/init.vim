" [neo]vim settings, parts taken or inspired by:
" @noopkat: https://github.com/noopkat/dotfiles/blob/master/.vimrc
" cheers.

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
Plug 'neomake/neomake'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --clang-completer' }
Plug 'rhysd/vim-clang-format'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

let g:deoplete#enable_at_startup = 1

syntax on
color dracula
set smartindent
set clipboard=unnamed " use os clipboard
set shiftwidth=2 " number of spaces when shift indenting
set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of spaces in tab when editing
set expandtab " tab to spaces
set number " show line numbers
set cursorline  " highlight current line
set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered
set hlsearch " highlight matches
let g:ctrlp_working_path_mode = 'r' " I copy and paste from other software a lot
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/* " lol
let g:ctrlp_show_hidden=1

" airline
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 0 
let g:airline#extensions#branch#enabled = 1 
let g:airline_left_sep = ' ❤  '
let g:airline_right_sep = ' 🟆  '
let g:airline_section_warning = '' 
let g:airline_section_y = '' 
let g:airline_section_x = '' 
set laststatus=2 " for airline
let g:airline_powerline_fonts=1

set noruler
set noshowmode
set autowrite

au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set backup

autocmd filetype cpp nnoremap <C-c> :w <bar> !g++ -std=c++17 -O2 % -o %:p:h/%:t:r.out && ./%:r.out<CR>
autocmd filetype c nnoremap <C-c> :w <bar> !gcc -std=c11 -lm % -o %:p:h/%:t:r.out && ./%:r.out<CR>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
map <C-n> :NERDTreeToggle<CR>
