" A customized init.vim for neovim (https://neovim.io/)

set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader = " "           " space as leader key

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Plug For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

"{{ The Basics }}
    Plug 'itchyny/lightline.vim'                       " Lightline statusbar
"{{ Syntax Highlighting and Colors }}
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set number relativenumber       " Display line numbers
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
syntax enable
let g:rehash256 = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to jk and kj in insert mode,, use mapped caps for other modes to avoid
" conflicts with jk in visual mode
:imap jk <Esc>
:imap kj <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'catppuccin_mocha',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" If status line is all black, set this
" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
" set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=2                " One tab == two spaces.
set tabstop=2                   " One tab == two spaces.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open terminal inside Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>th :vnew term://zsh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Replace all is aliased to S
nnoremap S :%s//g<Left><Left>

" Spell-check set to <Leader>o, 'o' for 'orthography':
map <Leader>o :setlocal spell! spelllang=en_us<CR>

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set termguicolors

" In some version combinations of alacritty + tmux + vim, vim can't properly detect which escape sequence it should use for truecolor. Add the following snippet to tell vim how the escape sequence should look:
if !empty($TMUX) && empty(&t_8f)
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
endif

colorscheme catppuccin_mocha

