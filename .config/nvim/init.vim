" A customized init.vim for neovim (https://neovim.io/)     

set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

"{{ The Basics }}
    Plug 'gmarik/Vundle.vim'                                             " Vundle
    Plug 'itchyny/lightline.vim'                                         " Lightline statusbar
    Plug 'suan/vim-instant-markdown', {'rtp': 'after'}                   " Markdown Preview
"{{ File management }}
    Plug 'vifm/vifm.vim'                                                 " Vifm
    Plug 'scrooloose/nerdtree'                                           " Nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    " Plug 'Xuyuanp/nerdtree-git-plugin' " git plugin for nerdtree
    " Highlighting Nerdtree
    Plug 'ryanoasis/vim-devicons'                                        " Icons for Nerdtree
    " Plug 'kyazdani42/nvim-web-devicons'
"{{ Productivity }}
    Plug 'vimwiki/vimwiki'                                               " VimWiki 
    Plug 'jreybert/vimagit'                                              " Magit-like plugin for vim
    Plug 'takac/vim-hardtime'                                            " Vim HardTime for vim speed
    Plug 'lambdalisue/suda.vim'                                          " Sudo write permissions
     "For React >> snippets
    Plug 'mlaursen/vim-react-snippets'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
     "Code and code detection
    Plug 'jparise/vim-graphql'
    Plug 'fatih/vim-go'                                                  " Vim plugin for golang
    Plug 'pangloss/vim-javascript'                                       " Vim plugin for javascript
    Plug 'othree/html5.vim'                                              " Html Syntax detection

"{{ Tim Pope Plugins }}
    Plug 'tpope/vim-surround'                                            " Change surrounding marks
    Plug 'tpope/vim-fugitive'                                            " Famous git vim plugin
"{{ Syntax Highlighting and Colors }}
    Plug 'PotatoesMaster/i3-vim-syntax'                                  " i3 config highlighting
    Plug 'kovetskiy/sxhkd-vim'                                           " sxhkd highlighting
    Plug 'vim-python/python-syntax'                                      " Python highlighting
    Plug 'ap/vim-css-color'                                              " Color previews for CSS
    Plug 'digitaltoad/vim-pug'                                           " Syntax highlighting for Html
    Plug 'frazrepo/vim-rainbow'
"{{ Junegunn Choi Plugins }}
    Plug 'junegunn/goyo.vim'                                             " Distraction-free viewing
    Plug 'junegunn/limelight.vim'                                        " Hyperfocus on a range
    Plug 'junegunn/vim-emoji'                                            " Vim needs emojis!

"{{ Completion }}
     " CtrlP Fuzzy File Finder
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}   " Conquer Of Completion for neovim (golang)

call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on


" Am using junegunn/vim-plug so Vundle plugininstall commands won't work here

" Brief help
" :PlugStatus                   - Check the status of plugins
" :PlugInstall [name ...]       - installs plugins; 
" :PlugUpdate [name ...]        - install or update plugins
" :PlugClean[!]                 - Remove unlisted plugins (bang version will clean without prompt)"
" PlugUpgrade                   - Upgrade vim-plug itself
" PlugDiff                      - Examine the changes from the previous update and the pending changes
" PlugSnapshot[!] [output path] -	Generate script for restoring the current snapshot of the plugins


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
set number relativenumber       " Display line numbers
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
syntax enable
let g:rehash256 = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Toggle hybrid numbers when in insert mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":augroup numbertoggle
":autocmd!
":autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
":autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
":augroup END

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
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The lightline.vim theme
" let g:lightline = {
"      \ 'colorscheme': 'darcula',
"      \ }
"
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
set laststatus=2

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
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
" let NERDTreeShowLineNumbers=1             "Causes scrolling to be slow
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38
let NERDTreeHighlightCursorline = 0

" nerdtree git plugin
let g:NERDTreeGitStatusUseNerdFonts = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" guifg and guibg for neovide

highlight Normal           guifg=#dfdfdf ctermfg=15   guibg=#282c34 ctermbg=none  cterm=none
highlight LineNr           guifg=#5b6268 ctermfg=8    guibg=#282c34 ctermbg=none  cterm=none
highlight CursorLineNr     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
highlight VertSplit        guifg=#1c1f24 ctermfg=0    guifg=#5b6268 ctermbg=8     cterm=none
highlight Statement        guifg=#98be65 ctermfg=2    guibg=none    ctermbg=none  cterm=none
highlight Directory        guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
highlight StatusLine       guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
highlight StatusLineNC     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
highlight NERDTreeClosable guifg=#98be65 ctermfg=2
highlight NERDTreeOpenable guifg=#5b6268 ctermfg=8
highlight Comment          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=italic
highlight Constant         guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
highlight Special          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
highlight Identifier       guifg=#5699af ctermfg=6    guibg=none    ctermbg=none  cterm=none
highlight PreProc          guifg=#c678dd ctermfg=5    guibg=none    ctermbg=none  cterm=none
highlight String           guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
highlight Number           guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
highlight Function         guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
" highlight Visual           guifg=#dfdfdf ctermfg=1    guibg=#1c1f24 ctermbg=none  cterm=none
" highlight WildMenu         ctermfg=0       ctermbg=80      cterm=none
" highlight Folded           ctermfg=103     ctermbg=234     cterm=none
" highlight FoldColumn       ctermfg=103     ctermbg=234     cterm=none
" highlight DiffAdd          ctermfg=none    ctermbg=23      cterm=none
" highlight DiffChange       ctermfg=none    ctermbg=56      cterm=none
" highlight DiffDelete       ctermfg=168     ctermbg=96      cterm=none
" highlight DiffText         ctermfg=0       ctermbg=80      cterm=none
" highlight SignColumn       ctermfg=244     ctermbg=235     cterm=none
highlight SignColumn       ctermfg=244     ctermbg=none     cterm=none
" highlight Conceal          ctermfg=251     ctermbg=none    cterm=none
" highlight SpellBad         ctermfg=168     ctermbg=none    cterm=underline
" highlight SpellCap         ctermfg=80      ctermbg=none    cterm=underline
" highlight SpellRare        ctermfg=121     ctermbg=none    cterm=underline
" highlight SpellLocal       ctermfg=186     ctermbg=none    cterm=underline
highlight Pmenu            ctermfg=251     ctermbg=234     cterm=none
highlight PmenuSel         ctermfg=0       ctermbg=111     cterm=none
highlight PmenuSbar        ctermfg=206     ctermbg=235     cterm=none
highlight PmenuThumb       ctermfg=235     ctermbg=206     cterm=none
" highlight TabLine          ctermfg=244     ctermbg=234     cterm=none
" highlight TablineSel       ctermfg=0       ctermbg=247     cterm=none
" highlight TablineFill      ctermfg=244     ctermbg=234     cterm=none
" highlight CursorColumn     ctermfg=none    ctermbg=236     cterm=none
" highlight CursorLine       ctermfg=none    ctermbg=236     cterm=none
" highlight ColorColumn      ctermfg=none    ctermbg=236     cterm=none
" highlight Cursor           ctermfg=0       ctermbg=5       cterm=none
" highlight htmlEndTag       ctermfg=114     ctermbg=none    cterm=none
" highlight xmlEndTag        ctermfg=114     ctermbg=none    cterm=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vifm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>sp :SplitVifm<CR>
map <Leader>dv :DiffVifm<CR>
map <Leader>tv :TabVifm<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_global_ext = 0     "use vimwiki filetype only for vimwiki files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Instant-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_slow = 1                             " Turns off update in real time
let g:instant_markdown_autostart = 0                        " Turns off auto preview
let g:instant_markdown_browser = "firefox --new-window"     " Uses firefox for preview

" Previews .md file
map <Leader>md :InstantMarkdownPreview<CR>                 
" Kills the preview
map <Leader>ms :InstantMarkdownStop<CR>                     


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open terminal inside Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>tt :vnew term://zsh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr
" set mouse=a       " for neovide

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fix Sizing Bug With Alacritty Terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

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
" => coc.nvim default settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

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

" See if either the diagnostic exists, otherwise the documentation on hover
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()
"""


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
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Tell vim-go to not map gd as its shortcut for go to definition
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
" disabled to allow coc.vim to do the gd resolution
let g:go_def_mapping_enabled = 0

" change from default snake_case to camelcase while converting
" let g:go_addtags_transform = "camelcase"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make CtrlP use ag for listing the files. Way fater and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Replace all is aliased to S
nnoremap S :%s//g<Left><Left>

" Spell-check set to <Leader>o, 'o' for 'orthography':
map <Leader>s :setlocal spell! spelllang=en_us<CR>

" Map keys for most used Go commands.
map <leader>b :GoBuild<CR>
map <leader>r :GoRun<CR>
map <leader>t :GoTest<CR>

let g:python_highlight_all = 1

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
"set guifont=SauceCodePro\ Nerd\ Font:h15
"set guifont=Mononoki\ Nerd\ Font:h15

"let g:neovide_transparency=0.95
