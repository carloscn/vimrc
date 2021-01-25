" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Leadf
Plug 'Yggdroot/LeaderF'

" GENTAGS
Plug 'jsfaint/gen_tags.vim'

" omnicppcomplete
Plug 'vim-scripts/OmniCppComplete'

" vim rainbow :RainbowToggle :RainbowLoad
Plug 'frazrepo/vim-rainbow'

" taglist
Plug 'vim-scripts/taglist.vim'
Plug 'preservim/tagbar'
Plug 'tpope/vim-surround'
Plug 'Shougo/neocomplcache.vim'
" Initialize plugin system
" http://ctrlpvim.github.io/ctrlp.vim/
Plug 'ctrlpvim/ctrlp.vim.git'
call plug#end()


set number
set syntax=on
set autoindent
set completeopt=preview,menu
set noeb
set nobackup
set noswapfile
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set fileformats=unix
set hlsearch
set mouse=a
set gcr=n-v-c:ver25-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor
let g:ycm_seed_identifiers_with_syntax=1 "自动补全命令
let g:ycm_complete_in_strings=1 "自动补全字符串
let Tlist_Enable_Fold_Column=1

inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i
noremap tt o<esc>
noremap TT O<esc>
nnoremap <C-S> :w<CR>

function! TabPos_ActivateBuffer(num)
    let s:count = a:num
    exe "tabfirst"
    exe "tabnext" s:count
endfunction

function! TabPos_Initialize()
for i in range(1, 9)
        exe "map <M-" . i . "> :call TabPos_ActivateBuffer(" . i . ")<CR>"
    endfor
    exe "map <M-0> :call TabPos_ActivateBuffer(10)<CR>"
endfunction

autocmd VimEnter * call TabPos_Initialize()
