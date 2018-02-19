" Global prefix
let mapleader=";"

" ------------------------------------------------------------------------------
" Key mapping
" ------------------------------------------------------------------------------
" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" ------------------------------------------------------------------------------
" Color scheme
" ------------------------------------------------------------------------------
syntax on
set term=screen-256color
set background=dark
colorscheme solarized

" powerline
source /usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/plugin/powerline.vim
set t_Co=256
let g:minBufExplForceSyntaxEnable = 1
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set noshowmode
set laststatus=2

" ------------------------------------------------------------------------------
" Utilities 
" ------------------------------------------------------------------------------
set autoread
set autowrite
set completeopt=longest,menu
set wildmenu
set scrolloff=3
set confirm
set relativenumber
set backspace=2
set mouse=a
set whichwrap+=<,>,h,l
set selection=exclusive
set selectmode=mouse,key
set report=0
set showmatch
set matchtime=1
set nofoldenable
filetype on
filetype plugin indent on

" encodings
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" share clipboard
set clipboard+=unnamed 

" column length as 80
highlight ColorColumn ctermbg=235 guibg=#2c2d27
set tw=80 fo+=t
set colorcolumn=+1

" hightlight current line
set cursorline
hi CursorLine   cterm=italic ctermbg=black ctermfg=green guibg=black guifg=green

" indent and wrap
set autoindent
set cindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap
set iskeyword+=_,$,@,%,#,-

" search and substitute
set ignorecase
set smartcase
set hlsearch
set incsearch
set gdefault

" Pair completion
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction


" ------------------------------------------------------------------------------
" Vundle
" ------------------------------------------------------------------------------
set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
""" Plugin 'tpope/vim-fugitive'
""" plugin from http://vim-scripts.org/vim/scripts.html
""" Plugin 'L9'
" Git plugin not hosted on GitHub
""" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
""" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" my bundle and plugins
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Bundle 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Bundle 'ShowTrailingWhitespace'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rhysd/vim-clang-format'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Bundle 'fholgado/minibufexpl'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD-tree 
" Open NERDTree by default
" autocmd VimEnter * NERDTree

" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p"
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction"")"")""
map <leader>t :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD-commentter 
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteme
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" highlight Pmenu ctermfg=2 ctermbg=238 guifg=#005f87 guibg=#EEE8D5
highlight Pmenu ctermfg=238 ctermbg=110 guifg=#005f87 guibg=#EEE8D5
" highlight PmenuSel ctermfg=2 ctermbg=220 guifg=#AFD700 guibg=#106900
highlight PmenuSel ctermfg=238 ctermbg=120 guifg=#AFD700 guibg=#106900
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_tags_files=1
set tags+=/data/misc/software/misc./vim/stdcpp.tags
inoremap <leader>; <C-x><C-o>
let g:ycm_error_symbol=0
let g:ycm_enable_diagnostic_signs=0
let g:ycm_filetype_blacklist={}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_map = '<leader>q'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm|idea)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP-funky
nnoremap <Leader>qf :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>qF :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-indent-guide
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-instant-markdown
map <leader>m :InstantMarkdownPreview<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-clang-format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : 0,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
" autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
" autocmd FileType c ClangFormatAutoEnable
" autocmd FileType cpp ClangFormatAutoEnable
