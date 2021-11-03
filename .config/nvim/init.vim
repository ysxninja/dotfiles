set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle For Managing Plugins
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "Vim polyglot
" let g:polyglot_disabled = ['markdown','go','html5']

call plug#begin('~/.vim/plugged')

"{{ The Basics }}
    Plug 'itchyny/lightline.vim'                                         " Lightline statusbar
    Plug 'itchyny/calendar.vim'
    " Plug 'suan/vim-instant-markdown', {'rtp': 'after'}                   " Markdown Preview
    Plug 'ThePrimeagen/vim-be-good'

    " Colorscheme Theme
    Plug 'joshdick/onedark.vim'
    Plug 'gruvbox-community/gruvbox'

    " Terminal toggler
    Plug 'akinsho/toggleterm.nvim'

"{{ File management }}
    Plug 'vifm/vifm.vim'                                                   " Vifm
    Plug 'scrooloose/nerdtree'                                             " Nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    " Plug 'Xuyuanp/nerdtree-git-plugin' " git plugin for nerdtree
    " Highlighting Nerdtree
    Plug 'ryanoasis/vim-devicons'                                          " Icons for Nerdtree
    " Plug 'kyazdani42/nvim-web-devicons'
    Plug 'mbbill/undotree'

"{{ Productivity }}
    Plug 'vimwiki/vimwiki', { 'branch': 'dev'}                             " VimWiki
    " Plug 'jreybert/vimagit'                                              " Magit-like plugin for vim
    " Plug 'takac/vim-hardtime'                                            " Vim HardTime for vim speed
    " Plug 'lambdalisue/suda.vim'                                          " Sudo write permissions

     "For React >> snippets
    " Plug 'SirVer/ultisnips'
    " Plug 'mlaursen/vim-react-snippets'                                   " snippets for developing react apps, rely on ultisnips from sirver
    Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

     "Code and code detection
    Plug 'ambv/black'                                                    " python formatter
    " Plug 'jparise/vim-graphql'
    Plug 'fatih/vim-go'                                                  " Vim plugin for golang

"{{ Tim Pope Plugins }}
    Plug 'tpope/vim-surround'                                            " Change surrounding marks
    Plug 'tpope/vim-fugitive'                                            " Famous git vim plugin
    Plug 'ya-suke/vim-eunuch' , { 'branch': 'fix/detection'}                         " Helpers for Unix

"{{ Syntax Highlighting and Color detection }}
"    Plug 'sheerun/vim-polyglot'                                          " A collection of language packs for vim
    " Plug 'vim-python/python-syntax'                                      " Python highlighting
    " Plug 'ap/vim-css-color'                                              " Color previews for CSS
    Plug 'rrethy/vim-hexokinase', {'do' : 'make hexokinase'}
    Plug 'luochen1990/rainbow'

"{{ Junegunn Choi Plugins }}
    Plug 'junegunn/goyo.vim'                                             " Distraction-free viewing
    " Plug 'junegunn/limelight.vim'                                        " Hyperfocus on a range
    " Plug 'junegunn/vim-emoji'                                            " Vim needs emojis!

"{{ Completion }}
     " CtrlP Fuzzy File Finder
    " Plug 'ctrlpvim/ctrlp.vim'
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}   " Conquer Of Completion for neovim (golang)
    Plug 'mattn/emmet-vim'                                               " Emmet for vim

"{{ Telescope }}
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

"{{ nvim-treesitter }}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'

call plug#end()

lua require('yasuke/telescope')

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
" set nohlsearch                  " stop highlighting search after esc
set guicursor=                   " remove pipe cursor on insert
set undodir=~/.vim/undodir
set undofile
set scrolloff=8                 " Better display for messages
set cmdheight=2                 " Smaller updatetime for CursorHold & CursorHoldI
set updatetime=50               " don't give |ins-completion-menu| messages.
set shortmess+=c                " always show signcolumns
set signcolumn=yes
set termguicolors
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/Android/*
set wildignore+=**/Music/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set nowrap
" set isfname+=@-@
syntax enable
" let g:rehash256 = 1
let loaded_matchparen = 1
let mapleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Toggle hybrid numbering in the focused window, and absolute in non-focused
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd WinEnter,FocusGained * :setlocal number relativenumber
autocmd WinLeave,FocusLost   * :setlocal number norelativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Enable syntax highlighing when I enter a JavaScript or TypeScript buffer
" and disable it when I leave
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to jk and kj in insert mode,, use mapped caps for other modes to avoid
" conflicts with jk in visual mode

:imap jk <Esc>
" :imap kj <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-git'
      \ ]

" coc-eslint and coc-prettier
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" If status line is all black, set this
" Always show statusline
" set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <leader>n : NERDTreeToggle<CR>
" map <C-n> :NERDTreeToggle<CR>
" let g:NERDTreeDirArrowExpandable = '►'
" let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers= 0             " 1 Causes scrolling to be slow
let NERDTreeShowHidden= 1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize= 23
let NERDTreeHighlightCursorline = 0

" nerdtree git plugin
" let g:NERDTreeGitStatusUseNerdFonts = 1

" auto reload on opening window
autocmd BufEnter NERD_tree_* | execute 'normal R'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme gruvbox
colorscheme onedark
highlight Normal guibg=none
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vifm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>vv :Vifm<CR>
" map <leader>vs :VsplitVifm<CR>
" map <leader>sp :SplitVifm<CR>
" map <leader>dv :DiffVifm<CR>
" map <leader>tv :TabVifm<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_list = [{'path': '~/vimwiki', 'template_path': '~/vimwiki/templates/',
          \ 'template_default': 'default', 'syntax': 'markdown', 'ext': '.md',
          \ 'path_html': '~/vimwiki/site_html/', 'custom_wiki2html': 'vimwiki_markdown',
          \ 'html_filename_parameterization': 1,
          \ 'template_ext': '.tpl',
          \ 'auto_diary_index': 1,}]

let g:vimwiki_global_ext = 0     "use vimwiki filetype only for vimwiki files

" map <leader>ww :VimwikiIndex <CR> :NERDTree /home/yasuke/vimwiki <CR> <C-l>

" fix for vimwiki#diary#calendar_action
autocmd FileType calendar nmap <buffer> <CR> :<C-u>call vimwiki#diary#calendar_action(b:calendar.day().get_day(), b:calendar.day().get_month(), b:calendar.day().get_year(), b:calendar.day().week(), "V")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hexokinase config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Hexokinase_refreshEvents = ['InsertLeave']

let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

" All possible highlighters
" virtual, sign_column, background, backgroundfull, foreground,foregroundfull

let g:Hexokinase_highlighters = ['backgroundfull']

" Reenable hexokinase on enter
autocmd VimEnter * HexokinaseTurnOn


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>u :UndotreeToggle<CR>

let g:undotree_RelativeTimestamp = 1
let g:undotree_ShortIndicators = 1
let g:undotree_HelpLine = 0
let g:undotree_WindowLayout = 2

if has("persistent_undo")
		set undodir=$HOME/.local/share/nvim/undodir
		set undofile
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open terminal inside Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vertical split
"map <leader>tt :vnew term://zsh<CR>

" horizontal split
" map <leader>tt :new term://zsh<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set mouse=nicr
" set mouse=a       " for neovide

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fix Sizing Bug With Alacritty Terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

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
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc.nvim default settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"" mapping to show documentation for the word under the cursor
nnoremap <silent> K :call CocAction('doHover')<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Perform code actions
nmap <leader>do <Plug>(coc-codeaction)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>pp  :<C-u>CocListResume<CR>

" Tell vim-go to not map gd as its shortcut for go to definition
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
" disabled to allow coc.vim to do the gd resolution
let g:go_def_mapping_enabled = 0

" change from default snake_case to camelcase while converting
let g:go_addtags_transform = "camelcase"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make CtrlP use ag for listing the files. Way faster and no useless files.
" let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
" let g:ctrlp_use_caching = 0

" Replace all
nnoremap <leader>z :%s//g<Left><Left>

" Spell-check set to Control-s:
map <C-s> :setlocal spell! spelllang=en_us<CR>

" Map keys for most used Go commands.
map <leader>b :GoBuild<CR>
map <leader>r :GoRun<CR>
map <leader>t :GoTest<CR>

" let g:python_highlight_all = 1

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org            call org#SetOrgFileType()

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create markmap from the whole file
nmap <leader>m <Plug>(coc-markmap-create)
" Create markmap from the selected lines
"vmap <leader>m <Plug>(coc-markmap-create-v)

" Command to create markmaps
command! -range=% Markmap CocCommand markmap.create <line1> <line2>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ToggleTerm
" set
let g:toggleterm_terminal_mapping = '<C-t>'
" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
map <leader>tt :ToggleTerm size=40 direction=vertical<CR>

" Bring back esc key in terminal to get back to normal mode
tnoremap <Esc> <C-\><C-n>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup YS
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup end

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun
command! Emptyregisters :call EmptyRegisters()

" remap to not lose what's in register after paste
vnoremap <leader>p "_dP
" nohl
nnoremap <leader>h :nohl<CR><C-l>
" enable vim rainbow globally for different parenthesis, brackets etc colors
let g:rainbow_active = 1

let g:rainbow_conf = {
\	'guifgs': ['#98c379', '#c678dd', '#d19a66', '#56b6c2'],
\	'ctermfgs': ['green', 'magenta', 'cyan', 'yellow'],
\	'guis': [''],
\	'cterms': [''],
\	'separately': {
\		'vimwiki': 0,
\		'nerdtree': 0,
\   }
\}

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Telescope
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>yf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>yb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>yh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>ys :lua require('yasuke/telescope').search_repos()<CR>

highlight Pmenu            guifg=#c678dd     guibg=none     cterm=none
" highlight PmenuSel         guifg=0       guibg=111     cterm=none
