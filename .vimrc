"  ___________________________________________  "
" |  __     _____ __  __                      | "
" |  \ \   / /_ _|  \/  |  One editor         | "
" |   \ \ / / | || |\/| |  to rule them all.  | "
" |    \ V /  | || |  | |                Rinz | "
" |     \_/  |___|_|  |_|  *       2020-08-25 | "
" |___________________________________________| "
"

let $USER = 'Rinz' "          Neovim on Linux   "
let g:plugtype = 1 "          GVim on Windows   "

"                  My Configs                   "
" ~                                             "
" .vim               linkto ~/.config/nvim      "
"   - .vimrc         linkto ~/.vimrc:~/.gvimrc  "
"   - autoload         :~/.config/nvim/init.vim "
"     - plug.vim     plugin manager             "
"   - bundle         plugins by vim-plug        "
"   - colors         using rinz.vim             "
"   - plugin         global plugins             "
"   - ftplugin                                  "
"   - syntax          {&filetype}.vim           "
"   - ultisnips                                 "
"   - files          (ignore)                   "
"   - others         (ignore)                   "

" vimrc                                         "
" - System Settings                             "
"   - Encoding                                  "
"   - Sounds                                    "
" - Display Options                             "
"   - Theme                                     "
"   - Status/Command Bar                        "
"   - Running on Terminal                       "
" - Editor Behavior                             "
"   - Indent                                    "
"   - Folding                                   "
"   - Searching                                 "
" - Mappings                                    "
" - Auto Complete                               "
" - Custom Functions                            "
" - Plugins                                     "
if has('win32') || has('win64')
    let $VIMHOME = $VIM . '/vimfiles'
else
    let $VIMHOME = $HOME . '/.vim'
endif
nnoremap <Leader><Leader>r :w<CR>:source $MYVIMRC<CR>
nnoremap <Leader><Leader>m :call <SID>Myvimrc()<CR>
nnoremap <Leader><Leader>c :call <SID>ColorFile()<CR>
nnoremap <Leader><Leader>s :call <SID>SyntaxFile()<CR>
nnoremap <Leader><Leader>f :call <SID>FtpluginFile()<CR>
nnoremap <Leader><Leader>u :call <SID>UltiSnipsFile()<CR>
nnoremap <Leader><Leader>a :call <SID>UserScripts()<CR>
nnoremap <leader><leader>t :call <SID>TestMode()<CR>
nnoremap <Leader><Leader>d :call <SID>DebugMode()<CR>
nnoremap <Leader><Leader>h :call <SID>HelpMe()<CR>
if empty(glob($VIMHOME . '/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
let g:testmode_wid = -1 " use for TestMode()
let g:debugmode_key = 0 " use for HTML view
" ============================================= "
" ============== System Settings ============== "
" ============================================= "
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set mousehide
set autoread

if !isdirectory($VIMHOME . '/files') && exists('*mkdir')
    call mkdir($VIMHOME . '/files')
endif
set backup
set writebackup
set backupdir=$VIMHOME/files/backup/
set swapfile
set directory=$VIMHOME/files/swap/
set updatecount=100
set undofile
set undodir=$VIMHOME/files/undo/
if has('nvim')
" set viminfo='100,n$VIMHOME/files/info/viminfo'
    set viminfo+=n$VIMHOME/files/info/nviminfo
else
    set viminfo+=n$VIMHOME/files/info/viminfo
endif

" ================== Encoding ================= "
set encoding=utf-8
set fileencodings=usc-bom,utf-8,gb18030,cp936,big5,latin1
set fileformats=unix,dos,mac
set ffs=unix,dos,mac
set termencoding=utf-8
set formatoptions+=m
set formatoptions+=B
set ambiwidth=double
set shortmess+=c

" augroup filetypedetect
"     auto BufRead,BufNewFile *.snippets set filetype=snippets
" augroup END
auto BufRead,BufNewFile *.snippets setf snippets
auto BufRead,BufNewFile *.mermaid,*.mer,*.mr setf mermaid
auto BufRead,BufNewFile *.flow,*.flw,*.mr setf flow
auto BufRead,BufNewFile *.UML,*.uml setf UML
auto BufRead,BufNewFile *.pc,*.pseudocode setf pseudocode

" =================== Sounds ================== "
set novisualbell
set noerrorbells
set t_vb= 
set visualbell t_vb= 
set timeoutlen=500

" ============================================= "
" ============== Display Options ============== "
" ============================================= "
syntax enable
syntax on
set number
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
set nowrap
set whichwrap=b,s,<,>,h,l
set showmatch
set matchtime=2
let loaded_matchparen=1
set nocursorline
set nocursorcolumn
set colorcolumn=80
if has('nvim')
    set signcolumn=number
else
    set signcolumn=yes
endif

" windows
set title
set splitbelow
set splitright

" =================== Theme =================== "
if has('gui_running')
    colorscheme night
    set background=light
elseif has('win32') || has('win64')
    colorscheme winter
    set background=dark
else
    set t_Co=256
    if &term =~ '256color'
        set t_tu=
    endif
    colorscheme snow
    set background=light
endif

nnoremap <Leader><Leader>1 yiw:match MatchColor1 '<C-r>0'<CR>
nnoremap <Leader><Leader>2 yiw:match MatchColor2 '<C-r>0'<CR>
nnoremap <Leader><Leader>3 yiw:match MatchColor3 '<C-r>0'<CR>
nnoremap <Leader><Leader>q yiw:call matchadd('Function','<C-r>0')<CR>
nnoremap <Leader><Leader>w yiw:call matchadd('Class','<C-r>0')<CR>
nnoremap <Leader><Leader>e yiw:call matchadd('Constant','<C-r>0')<CR>

nnoremap <F12> :call LightOrDark()<CR>
func! LightOrDark()
    if &background == 'light'
        exec 'set background=dark'
    else
        exec 'set background=light'
    endif
endfunc

" ============= Status/Command Bar ============ "
set ruler
set wildmenu
set wildignore=*.swp,*.o,*~,*.pyc,*.class,*.exe
set hidden
set ttyfast

set showcmd
set showmode
let $LANG = 'en'
set langmenu=en

" Status Bar
set statusline=\ \$\ %.50f%r%w%=%l,%c\ \ \ \ \ \ \ \\%b\ \ \ \ \ %{&fenc}\|%{&ff}\|%{&ft}\ %p%%
set laststatus=2
set cmdheight=1
" set tabline=%t

" ========== Running on Terminal/GUI ========== "
if has('nvim')
    tnoremap <C-n> <C-\><C-n>
    tnoremap <C-o> <C-\><C-o>
    let g:neoterm_autoscroll = 1
    let g:terminal_color_0 = '#000000'
    let g:terminal_color_1 = '#ff5555'
    let g:terminal_color_2 = '#50fa7b'
    let g:terminal_color_3 = '#f1fa8c'
    let g:terminal_color_4 = '#db93f9'
    let g:terminal_color_5 = '#ff79c6'
    let g:terminal_color_6 = '#8be9fd'
    let g:terminal_color_7 = '#bfbfbf'
    let g:terminal_color_8 = '#4d4d4d'
    let g:terminal_color_9 = '#ff6e67'
    let g:terminal_color_10 = '#5af78e'
    let g:terminal_color_11 = '#f4f99d'
    let g:terminal_color_12 = '#caa9fa'
    let g:terminal_color_13 = '#ff92d0'
    let g:terminal_color_14 = '#ffaf00'
    let g:terminal_color_15 = '#9aedfe'
"     let g:terminal_color_background = '#000000'
"     let g:terminal_color_foreground = '#000000'
elseif has('gui_running')
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    if has('win32') || has('win64')
        auto GUIEnter * simalt ~x
    else
        auto GUIEnter * call MaximizeWindow()
    endif
else
    if has('autocmd')
    auto VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
    auto InsertEnter,InsertChange *
        \ if v:insertmode == 'i' |
        \   silent execute '!echo -ne "\e[5 q"' | redraw! |
        \ elseif v:insertmode == 'r' |
        \   silent execute '!echo -ne "\e[3 q"' | redraw! |
        \ endif
    auto VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
    endif
endif
func! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunc

if has('win32') || has('win64')
    set guifont=Consolas:h12
else
    set guifont=Consolas\ 11
endif


set guioptions-=m
set guioptions-=T
" map <silent> <F12> : if $guioptions=~#'T' <Bar>
"         \set guioptions-=T <Bar>
"         \set guioptions-=m <Bar>
"     \else <Bar>
"         \set guioptions+=T <Bar>
"         \set guioptions+=m <Bar>
"     \endif<CR>
nnoremap <F11> :call GuiSwitch()<CR>
func! GuiSwitch()
    if &guioptions =~# 'T'
        set guioptions-=T
        set guioptions-=m
    else
        set guioptions+=T
        set guioptions+=m
    endif
endfunc

" ============================================= "
" =============== Editor Behavior ============= "
" ============================================= "
set history=2000
set textwidth=999
set clipboard=unnamedplus
" set lines=24 columns=79
auto InsertEnter * set norelativenumber number " nocursorline
auto InsertLeave * set relativenumber " cursorline
auto WinLeave * set norelativenumber number " nocursorline nocursorline
set scrolloff=7
set sidescrolloff=5

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exec 'normal! g`"' |
    \ endif

" =================== Indent  ================= "
" Tab
set expandtab
set smarttab
set shiftround
set shiftwidth=4
set tabstop=8
set softtabstop=4

" Backspace
" set backspace=2
set backspace=eol,start,indent

" Space    "}j
if has('nvim')
    nnoremap <silent><Space> :noh<CR>zR
else
    nnoremap <silent><Space> :call <SID>SpaceMethod()<CR>:noh<CR>zR
endif
func! <SID>SpaceMethod()
    if term_list() != [] && $filetype == ''
        exec 'close'
    endif
endfunc


" Indent
" set smartindent
" set autoindent
set cinoptions+=g0   " public etc. in cpp

" GNU style
" set shiftwidth=2
" set tabstop=8
" set cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1

" ================== Folding ================== "
set foldmethod=indent
set foldlevel=0
set foldlevelstart=99
normal zR

" ================= Searching ================= "
set magic
set hlsearch
set incsearch
set ignorecase
set smartcase
exec 'nohlsearch'

" ============================================= "
" ================== Mappings ================= "
" ============================================= "
" let mapleader='\'
" auto FileType python,pyrex nnoremap K yiw:terminal python -m pydoc "<C-r>0"<CR>

nnoremap ; :
vnoremap ; :normal<Space>

nnoremap U <C-r>
" cmap w!! w !sudo tee >/dev/null %
" cnoremap W w!
cnoremap Q q!
nnoremap Q <nop>
nnoremap t <nop>
nnoremap dt dt
nnoremap ct ct
nnoremap yt yt
nnoremap T <nop>
nnoremap dT dT
nnoremap cT cT
nnoremap yT yT
nnoremap <expr>e col('.')==1?'$':'0'
vnoremap <expr>e col('.')==1?'$':'0'
nnoremap de d$
nnoremap ce c$
nnoremap ye y$
nnoremap dE d^
nnoremap cE c^
nnoremap yE y^

if has('win32') || has('win64')
    nnoremap p ""p
    nnoremap P ""P
endif
nnoremap <Leader>p :set paste<CR>"+p:set nopaste<CR>"
nnoremap <Leader>y "+y
" nnoremap <C-s> :call <SID>SynStack()<CR>
" func! <SID>SynStack()
"     echo map(synstack(line('.'),col('.')),'synIDattr(v:val,"name")')
" endfunc
nmap <C-s> <Plug>SyntaxGroup
map <Plug>SyntaxGroup :call <SID>SyntaxGroup()<CR>
func! <SID>SyntaxGroup()
    let syn_id = synID(line('.'), col('.'), 'synIDattr(v:val,"name")')
    if (!syn_id)
        echohl WarningMsg
        echo 'no syntax group here'
        echohl None
        return
    endif
    let syn_name = synIDattr(syn_id, 'name')
    let tran_id = synIDtrans(syn_id)
    echohl MoreMsg
    echo 'Syntax: ' . syn_name . '->'. synIDattr(tran_id, 'name')
    echohl None
endfunc
nmap <C-q> <C-s>
" FuncKey
map <F1> <nop>
inoremap <F2> <nop>
nnoremap <F3> :%s/

" Split
nnoremap gk <C-w>k
nnoremap gj <C-w>j
nnoremap gh <C-w>h
nnoremap gl <C-w>l
nnoremap QQ <C-w>q
nnoremap <Up> :res -5<CR>
nnoremap <Down> :res +5<CR>
nnoremap <Left> :vert res -5<CR>
nnoremap <Right> :vert res +5<CR>

" Tab
nnoremap tm i<+MARK+><Esc>
nnoremap tg /<+MARK+><CR>:nohlsearch<CR>c8l
nnoremap te :tabe<CR>
nnoremap th :-tabnext<CR>
nnoremap tl :+tabnext<CR>
nnoremap tc :close<CR>
nnoremap to :only<CR>
nnoremap tn :call ToNote()<CR>
vnoremap tn :call ToNote()<CR>
nnoremap tu :call ToUnnote()<CR>
vnoremap tu :call ToUnnote()<CR>
func! ToNote()
    if &filetype == 'vim'
        normal 0i"
        normal lr 
        normal 0
    elseif &filetype == 'scheme'
        normal 0i; 
    elseif &filetype == 'c'
        \ || &filetype == 'cpp'
        \ || &filetype == 'java'
        \ || &filetype == 'go'
        \ || &filetype == 'javascript'
        \ || &filetype == 'html'
        normal 0i// 
        normal 0
"     elseif &filetype == 'html'
"         normal 0i<!--
"         normal lr 
"         normal A -->
"         normal <<<<
    else
        normal 0i# 
        normal 0
    endif
endfunc
" func! ToNote()
"     if &filetype == 'vim'
"         normal 0i"
"         normal lr 
"        normal 0
"     elseif &filetype == 'c' || &filetype == 'cpp'
"         normal 0i// 
"         normal 0
"     elseif &filetype == 'python'
"         normal 0i# 
"         normal 0
"     else
"         normal 0i# 
"         normal 0
"     endif
" endfunc
func! ToUnnote()
    normal 0df 
endfunc
" func! ToUnnote()
"     if &filetype == 'html'
"         normal 0df 
"         normal $dF>
"     else
"         normal 0df 
"     endif
" endfunc

" Format
nnoremap tt v"zy:Tab/<C-r>z<CR>
nnoremap tf ve"zy:Tab/<C-r>z<CR>

" Edit
nnoremap s cw
nnoremap S ?\W<CR>l:noh<CR>cw
" nnoremap e o<CR><Esc>?<++><CR>:noh<CR>c4l
" nnoremap E O<+++><Esc>O<++><Esc>/<+++><CR>d5l/<++><CR>:noh<CR>c4l
nnoremap H ^i
nnoremap L $a
" nnoremap <expr>n 'Nn'[v:searchforword]
" nnoremap <expr>N 'nN'[v:searchforword]

nnoremap <C-k> <C-v>k
nnoremap <C-j> <C-v>j
nnoremap <C-h> <C-v>h
nnoremap <C-l> <C-v>l
" nnoremap <C-k> i<++><Esc>O<Esc>/<++><CR>:noh<CR>d4l
" nnoremap <C-j> i<++><Esc>o<Esc>/<++><CR>:noh<CR>d4l
" nnoremap <C-h> <<
" nnoremap <C-l> >>

vnoremap <C-h> <
vnoremap <C-l> >
xnoremap < <gv
xnoremap > >gv

inoremap <C-l> <C-[>la
inoremap <C-h> <C-[>i
inoremap <C-f> <End>
inoremap <C-b> <Home>
inoremap <M-l> <Esc>ea
inoremap <M-h> <Esc>bi
inoremap <M-f> <Esc>Wea
inoremap <M-b> <Esc>Bi

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i


imap <C-j> <Plug><C-j>
imap <C-k> <Plug><C-k>
imap <C-g> <Plug><C-g>

" ============================================= "
" =============== Auto Complete =============== "
" ============================================= "
auto BufNewFile *.* call AutoSetFileHead()
func! AutoSetFileHead()
    if expand('%:e') == 'sh'
        call setline(1, "\#!/bin/bash")
    elseif expand('%:e') == 'pc'
        call setline(1, "\# vim: ft=pseudocode ff=unix fenc=utf-8")
    elseif expand('%:e') == 'c'
"         call setline(1, "#include <stdio.h>")
"         call setline(2, "#include <stdlib.h>")
"         call setline(3, "#include <string.h>")
"         call setline(4, "#include \"" . expand("%:t:r") . ".h\"")
"         call setline(5, "")
        call setline(1, "/*  " . expand("%:t") . "  */")
        call setline(2, "")
        call setline(3, "#include \"../include/stdc.h\"")
        call setline(4, "#include \"../include/" . expand("%:t:r") . ".h\"")
        call setline(5, "")
        normal G
    elseif expand('%:e') == 'cc'
        call setline(1, "#include <bits/stdc++.h>")
"         call setline(2, "#include \"" . expand("%:t:r") . ".hh\"")
        call setline(2, "using namespace std;")
        call setline(3, "")
        call setline(4, "int main()")
        call setline(5, "{")
        call setline(6, "    return 0;")
        call setline(7, "}")
        normal 5gg
    elseif expand('%:e') == 'cpp' || expand('%:e') == 'cxx'
        call setline(1, "#include <iostream>")
        call setline(2, "#include \"" . expand("%:t:r") . ".hpp\"")
        call setline(3, "")
        normal G
    elseif expand('%:e') == 'h'
        call setline(1, "// ../src/" . expand("%:t:r") . ".c")
        call setline(2, "// vim: ft=c ff=unix fenc=utf-8")
        call setline(3, "#ifndef __" . toupper(expand("%:t:r")) . "_H__")
        call setline(4, "#define __" . toupper(expand("%:t:r")) . "_H__")
        call setline(5, "#ifdef __cplusplus")
        call setline(6, "extern \"C\" {")
        call setline(7, "#endif")
        call setline(8, "")
        call setline(9, "#include <stddef.h>")
        call setline(10, "")
        call setline(11, "#ifdef __cplusplus")
        call setline(12, "}")
        call setline(13, "#endif")
        call setline(14, "#endif  /*  " . expand("%:t") . "  */")
        normal 9gg
    elseif expand('%:e') == 'hh' || expand('%:e') == 'hpp' || expand('%:e') == 'hxx'
        call setline(1, "// vim: ft=cpp ff=unix fenc=utf-8")
        call setline(2, "#ifndef __" . toupper(expand("%:t:r")) . "_" . toupper(expand('%:e')) . "__")
        call setline(3, "#define __" . toupper(expand("%:t:r")) . "_" . toupper(expand('%:e')) . "__")
        call setline(4, "#ifdef __cplusplus")
        call setline(5, "extern \"C\" {")
        call setline(6, "#endif")
        call setline(7, "")
        call setline(8, "#ifdef __cplusplus")
        call setline(9, "}")
        call setline(10, "#endif")
        call setline(11, "#endif    //" . expand("%:t"))
        normal 7gg
    elseif expand('%:e') == 'py' || expand('%:e') == 'pyx'
        call setline(1, "#!/usr/bin/env python3")
        call setline(2, "# -*- coding:utf-8 -*-")
        call setline(3, "")
        normal G
    elseif expand('%:e') == 'go'
        call setline(1, "package main")
        call setline(2, 'import "fmt"')
        call setline(3, "")
        normal G
    elseif expand('%:e') == 'html' || expand('%:e') == 'htm'
        call setline(1, "<!DOCTYPE html>")
        call setline(2, "<html>")
        call setline(3, "<head>")
        call setline(4, "<meta charset=\"utf-8\" />")
        call setline(5, "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />")
        call setline(6, "<title>" . expand("%:t:r") . "</title>")
        call setline(7, "</head>")
        call setline(8, "<body>")
        call setline(9, "")
        call setline(10, "</body>")
        call setline(11, "</html>")
        normal 8gg
    endif
endfunc

if has('autocmd')
    auto BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set completeopt=longest,menu
auto InsertLeave * if pumvisible() == 0|pclose|endif

auto FileType c,cpp,java,go,php,javascript,python,xml,yml,perl auto BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
func! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(1, c)
endfunc

if has('autocmd')
    auto Syntax * call matchadd('Todo', '\W\zs\%(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    auto Syntax * call matchadd('Debug', '\W\zs\%(NOTE\|INFO\|IDEA\|NOTICE\)')
    auto Syntax * call matchadd('Continued', '\W\zs\%(\%(<=\+\)\=\s*[Tt]o\s\=[Bb]e\s\=[Cc]ontinued\.*\)')
endif

" func! <SID>Ftsettings()
"     inoremap <Plug><C-j> <C-m>
"     inoremap <Plug><C-k> <End><C-m>
"     inoremap <Plug><C-g> ()<Esc>i
"     if &filetype == 'vim'
"         inoremap <Plug><C-g> \%(\)<Esc>hi
"         setlocal cursorline
"     elseif &filetype == 'snippets'
"         setlocal noexpandtab
"         setlocal tabstop=8 shiftwidth=8 softtabstop=8
"         inoremap <Plug><C-j> <CR><space><Esc>vr<c-i>a
"         imap <Plug><C-k> <Plug><C-j>
"     elseif &filetype == 'text'
"         setlocal wrap
"         setlocal autoindent
"         setlocal cc=0
"         setlocal scrolloff=0
"         setlocal sidescrolloff=0
"         nnoremap s s
"         nnoremap j gj
"         nnoremap k gk
"         vnoremap j gj
"         vnoremap k gk
"         inoremap <Plug><C-j> <C-m><C-m>
"         inoremap <Plug><C-k> <C-m>
"     elseif &filetype == 'markdown'
"         setlocal wrap
"         setlocal autoindent
"         setlocal cc=0
"         setlocal scrolloff=0
"         setlocal sidescrolloff=0
"         inoremap ` ``<Esc>i
"         nnoremap j gj
"         nnoremap k gk
"         vnoremap j gj
"         vnoremap k gk
"         inoremap <Plug><C-j> <C-m><C-m>
"         inoremap <Plug><C-k> <Space><Space><C-m>
"     elseif &filetype == 'pseudocode'
"         setlocal tabstop=2 shiftwidth=2 softtabstop=2
"         setlocal autoindent
"         inoremap <Plug><C-j> <End><Space>{<CR>}<Esc>O
"         inoremap <Plug><C-k> <End>;<C-m>
"     elseif &filetype == 'scheme'
"         setlocal tabstop=2 shiftwidth=2 softtabstop=2
"         setlocal lisp
"         inoremap ' '()<Esc>i
"         inoremap <Plug><C-j> <Esc>^%a<CR>
"         inoremap <Plug><C-k> <ESc>jI
"     elseif &filetype == 'yaml'
"         syntax off
"         setlocal foldmethod=indent
"         setlocal noexpandtab
"     elseif &filetype == 'c'
"         setlocal foldmethod=syntax
"         inoremap <Plug><C-j> <End><Space>{<CR>}<Esc>O
"         inoremap <Plug><C-k> <End>;<C-m>
" "         inoremap <Plug><C-g> <++><Esc>yiw/<++><CR>c4l->vptr-><++>()<Esc>hp?<++><CR>c4l
"         inoremap <Plug><C-g> ->
"     elseif &filetype == 'cpp'
"         setlocal foldmethod=syntax
"         inoremap <Plug><C-j> <End><Space>{<CR>}<Esc>O
"         inoremap <Plug><C-k> <End>;<C-m>
"         inoremap <Plug><C-g> *()<Esc>i
"     elseif  &filetype == 'make'
"         setlocal foldmethod=syntax
"         setlocal noexpandtab
"         setlocal tabstop=4 shiftwidth=4 softtabstop=4
" "     elseif &filetype == 'cs' || &filetype == 'java' || &filetype == 'go'
" "         setlocal foldmethod=syntax
" "         inoremap <Plug><C-j> <End><Space>{<CR>}<Esc>O
" "         inoremap <Plug><C-k> <End>;<C-m>
"     elseif &filetype == 'cs' || &filetype == 'java'
"         setlocal foldmethod=syntax
"         inoremap <Plug><C-j> <End><Space>{<CR>}<Esc>O
"         inoremap <Plug><C-k> <End>;<C-m>
"     elseif  &filetype == 'go'
"         setlocal foldmethod=syntax
"         setlocal noexpandtab
"         setlocal tabstop=4 shiftwidth=4 softtabstop=4
"         inoremap <Plug><C-j> <End><Space>{<CR>}<Esc>O
"         inoremap <Plug><C-k> <End>;<C-m>
"     elseif &filetype == 'python' || &filetype == 'pyrex'
"         setlocal foldmethod=indent
"         inoremap <Plug><C-j> <End>:<CR>
"         imap <Plug><C-k> <Plug><C-j>
"     elseif &filetype == 'javascript'
"         setlocal tabstop=2 shiftwidth=2 softtabstop=2
"         inoremap < <
"         inoremap ` ``<Esc>i
"         inoremap <Plug><C-j> <End><Space>{<CR>}<Esc>O
"         inoremap <Plug><C-k> <End>;<C-m>
" "         inoremap <Plug><C-k> <++><Esc>jA;<Esc>?<++><CR>c4l
"         inoremap <Plug><C-g> <End><Space>{<CR>};<Esc>O
"     elseif &filetype == 'html' || &filetype == 'css'
"         setlocal tabstop=2 shiftwidth=2 softtabstop=2
"         inoremap < <><Esc>i
"         inoremap <Plug><C-j> <End><Space>{<CR>}<Esc>O
"         inoremap <Plug><C-k> <End>;<C-m>
"         inoremap <Plug><C-g> <Esc>T<ve"0yA</><Esc>"0PF<i
"     elseif &filetype == 'xml'
"         setlocal tabstop=2 shiftwidth=2 softtabstop=2
"         inoremap < <><Esc>i
"         inoremap <Plug><C-j> <Esc>yi<f>a</><Esc>hpF<i
"     elseif &filetype == 'json'
"         inoremap <Plug><C-j> <End>:[<CR>]<Esc>O
"     endif
" endfunc
" func! <SID>FtsettingsMsg()
"     call <SID>Ftsettings()
"     echohl MoreMsg
"     echo "Ftsettings: " . &filetype
"     echohl None
" endfunc
" auto BufRead,BufNewFile *.* call <SID>Ftsettings()
" auto FileType * call <SID>Ftsettings()
" auto BufEnter * if exists('source $VIMHOME/ftplugin/' .&ft.'.vim') |
"     \ exec 'source $VIMHOME/ftplugin/' . &ft .'.vim' | endif
auto BufEnter *  exec 'source $VIMHOME/ftplugin/' . &ft .'.vim'

" ============================================= "
" ============== Custom Functions ============= "
" ============================================= "
if has('nvim')
    nmap <F5> mo:call RunOnBash()<CR>
    imap <F5> <Esc>mo:call RunOnBash()<CR>
    vmap <F5> <Esc>mo:call RunOnBash()<CR>
else
    nmap <F5> :call RunOnBuiltinTerminal()<CR>
    imap <F5> <Esc>:call RunOnBuiltinTerminal()<CR>
    vmap <F5> <Esc>:call RunOnBuiltinTerminal()<CR>
endif
func! RunOnBash()
    if g:testmode_wid >= 0
        call win_gotoid(g:testmode_wid)
    endif
    exec 'wa'
    if &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'scheme'
        exec '!chezscheme %'
    elseif &filetype == 'c'
        if g:debugmode_key
            normal G
            exec 'r !tcc -run %'
        else
            exec '!gcc % -o %<'
            exec '!time ./%<'
        endif
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cs'
        exec '!mcs %'
        exec '!time mono %:r.exe'
    elseif &filetype == 'java'
        exec '!javac %'
        exec '!time java %<'
    elseif &filetype == 'html'
        if g:debugmode_key
            return
        else
            exec 'ter firefox %'
        endif
    elseif &filetype == 'javascript'
        if g:debugmode_key
            exec '!time node %'
        endif
    elseif &filetype == 'typescript'
        exec '!tsc %'
        exec '!time node ' . expand('%:r') . '.js'
    elseif &filetype == 'python'
        exec '!time python3 %'
    elseif &filetype == 'go'
        exec '!time go run %'
    elseif &filetype == 'markdown'
        exec '!Typora %'
    endif
endfunc
func! RunOnBuiltinTerminal()
    if term_list() == []
        if g:testmode_wid >= 0
            call win_gotoid(g:testmode_wid)
        endif
        exec 'wa'
        if &filetype == 'scheme'
            exec '!chezscheme %'
        elseif &filetype == 'c'
            if g:plugtype==0
                exec 'ter tcc -run %'
            else
                exec '!gcc % -o %<'
                exec 'ter ./%<'
            endif
        elseif &filetype == 'cpp'
            exec '!g++ % -o %<'
            exec 'ter ./%<'
        elseif &filetype == 'cs'
            exec '!mcs %'
            exec '!ter mono %:r.exe'
        elseif &filetype == 'java'
            exec '!javac %'
            exec 'ter java %:r'
        elseif &filetype == 'html'
            if g:debugmode_key
                return
            else
                exec '!firefox %'
            endif
        elseif &filetype == 'javascript'
            if g:debugmode_key
                exec 'ter node %'
            endif
        elseif &filetype == 'python'
            exec '!ter python3 %'
        elseif &filetype == 'go'
            exec 'ter go run %:r'
        elseif &filetype == 'markdown'
            exec '!Typora %'
        endif
    else
        exec 'close'
        normal 'o
    endif
endfunc

nmap <F6> :call RunOnNeovimTerminal()<CR>
imap <F6> <Esc>:call RunOnNeovimTerminal()<CR>
vmap <F6> <Esc>:call RunOnNeovimTerminal()<CR>
func! RunOnNeovimTerminal()
    if g:testmode_wid >= 0
        call win_gotoid(g:testmode_wid)
    endif
    exec 'wa'
    if &filetype == 'sh'
        exec 'ter bash %'
    elseif &filetype == 'c'
        exec 'ter tcc -run %'
"         exec '!gcc % -o %<'
"         exec 'ter ./%<'
"         normal G
"         call append(line("."), "")
"         call append(line(".") + 1, "/********************")
"         call append(line(".") + 2, "")
"         normal G
"         exec 'r !tcc -run %'
"         normal G
"         call append(line("."), "")
"         call append(line(".") + 1, "********************/")
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec 'ter ./%<'
    elseif &filetype == 'cs'
        exec '!mcs %'
        exec 'ter mono %:r.exe'
    elseif &filetype == 'java'
        exec '!javac %'
        exec 'ter java ./%:r'
    elseif &filetype == 'html'
        if g:debugmode_key
            return
        else
            let g:debugmode_key = 1
"             exec '!firefox %'
        endif
    elseif &filetype == 'javascript'
"         exec 'ter node %'
    elseif &filetype == 'python'
        exec 'ter python3 ./%'
    elseif &filetype == 'go'
        exec 'ter go run ./%:r'
    endif
    if has('nvim')
        normal i
    endif
endfunc

map<F7> :call CompileForPy()<CR>
imap<F7> <Esc>:call CompileForPy()<CR>
vmap<F7> <Esc>:call CompileForPy()<CR>
func! CompileForPy()
    exec 'w'
    if &filetype == 'pyrex'   " cython
        exec '!python setup.py build_ext --inplace'
    elseif &filetype == 'c'
        exec '!gcc % -fPIC -shared -o libc.so'
    elseif &filetype == 'cpp'
        exec '!g++ % -fPIC -shared -o libcpp.so'
    endif
endfunc

map <F8> :call Autopep8()<CR>
imap <F8> <Esc>:call Autopep8()<CR>
vmap <F8> <Esc>:call Autopep8()<CR>
func! Autopep8()
    exec 'w'
    if &filetype == 'python' || &filetype == 'pyrex'
        exec '!autopep8 --in-place --aggressive --aggressive %'
        exec 'e %'
    else
        normal gg=G
    endif
endfunc

if has('nvim')
    nnoremap <F9> :echo 'Coming Sooooooon'
    vnoremap <F9> <Esc>:echo 'Coming Sooooooon'
else
    nnoremap <F9> :SendToTerminal()<CR>
    vnoremap <F9> <Esc>:SendToTerminal()<CR>
endif
func! SendToTerminal()
    let buff_n = term_list()
    if len(buff_n) > 0
        let buff_n = buff_n[0]
        let lines = getline(getpos("'<")[1], getpos("'>")[1])
        let indent = match(lines[0, '[^ \t]'])
        for l in lines
            let new_indent = match(l, '[^ \t]')
            if new_indent == 0
                call term_sendkeys(buff_n, l."\<CR>")
            else
                call term_sendkeys(buff_n, l[indent:]."\<CR>")
            endif
            sleep 10m
        endfor
    endif
endfunc


func! TimeStamp()
    if &ft == 'vim'
        let cmt = '" '
    elseif &ft == 'c' || &ft == 'cpp' || &ft == 'java'
        let cmt = '// '
    else
        let cmt = '# '
    endif
    call append(line("."), cmt . 'vim: ft=' . &ft .
                \' ff=unix fenc=utf-8 ts=8 sw=4 et')
    call append(line(".")+1, cmt . 'Last Change: ' .
                \strftime('%Y.%m.%d %H:%M:%S') . '    #TheEnd')
endfunc

func! NumberLine() range
    for l:line in range(a:firstline, a:lastline)
        let l:sLine = getline(l:line)
        let l:sLine = l:line . ' ' . l:sLine
        cal setline(l:line, l:sLine)
    endfor
endfunc
com! -range=% NL <line1>,<line2>call NumberLine()

func! NumberRelat(count) abort
    let l:cursor = line('.')
    let l:eof = line('$')
    for l:count in range(0, a:count)
        let l:line = l:cursor + l:count
        if l:line > l:eof
            break
        endif
        let l:sLine = getline(l:line)
        let l:sLine = l:count . ' ' . l:sLine
        call setline(l:line, l:sLine)
    endfor
endfunc
com! -count NR call NumberRelat(<count>)

func! <SID>Resource()
"     let t_m = -1
"     if g:testmode_wid >= 0
"         let t_m = g:testmode_wid
"     endif
"     let d_m = 0
"     if g:debugmode_key
"         let d_m = 1
"     endif
"     exec 'w'
"     exec 'source $MYVIMRC'
"     let g:testmode_wid = d_m
"     if d_m
"         let g:debugmode_key = 1
"     endif
    exec 'w'
    exec 'source $MYVIMRC'
endfunc
func! <SID>Myvimrc()
    if has('win32') || has('win64')
        let file = "~/.vimrc"
    else
        let file = $VIMHOME . "/.vimrc"
    endif
    exec 'tabnew ' . file
endfunc
func! <SID>ColorFile()
    if has('gui_running')
        let file = $VIMHOME . "/colors/night.vim"
    elseif has('win32') || has('win64')
        let file = $VIMHOME . "/colors/winter.vim"
    else
        let file = $VIMHOME . "/colors/snow.vim"
    endif
    exec 'tabnew ' . file
endfunc
func! <SID>SyntaxFile()
    let file = $VIMHOME . "/syntax/" . &filetype . ".vim"
    exec 'tabnew ' . file
endfunc
func! <SID>FtpluginFile()
    let file = $VIMHOME . "/ftplugin/" . &filetype . ".vim"
    exec 'tabnew ' . file
endfunc
func! <SID>UltiSnipsFile()
    let file = $VIMHOME . "/ultisnips/" . &filetype . ".snippets"
    exec 'tabnew ' . file
endfunc
func! <SID>UserScripts()
    let file = $VIMHOME . "/autoload/" . tolower($USER) . ".vim"
    exec 'tabnew ' . file
endfunc
func! <SID>HelpMe()
    let wid_main = win_getid()
    let file = $VIMHOME . "/others/"
    exec 'vs ' . file
    vertical resize 24
    let wid_help = win_getid()
    call win_gotoid(wid_main)
    let file = $VIMHOME . "/others/tmp.vim"
    exec 'sp ' . file
    resize 3
    call win_gotoid(wid_help)
endfunc

" =================== Modes =================== "
let s:statuscolors = {
    \ 'orange': {'gui': "#ff7700", 'cterm': "208"},
    \ 'green' : {'gui': "#32cd32", 'cterm': "040"}}
func! <SID>StatusColor(mode)
    if has('gui_running')
        let style = 'guifg=' . s:statuscolors[a:mode]['gui']
    else
        let style = 'ctermfg=' . s:statuscolors[a:mode]['cterm']
    endif
"     echo g:statuscolors[a:mode][has('gui_running') ? 'gui' : 'cterm']
"     let color =  g:statuscolors[a:mode][has('gui_running') ? 'gui' : 'cterm']
    exec 'hi StatusLine '     . style
    exec 'hi StatusLineNC '   . style
    exec 'hi Title '          . style
    exec 'hi TabLine '        . style
    exec 'hi TabLineSel '     . style
    exec 'hi ModeMsg '        . style
endfunc

func! <SID>TestMode()
    if &filetype == 'c'
        let file = expand("%")
        exec 'vs TEST.c'
        let g:testmode_wid = win_getid()
        call setline(4, "#include \"" . file . "\"  /*  C TEST MODE  */")
        call setline(5, "")
    elseif &filetype == 'cpp'
        let file = expand("%")
        exec 'vs TEST.cpp'
        let g:testmode_wid = win_getid()
        call setline(1, "#include <bits/stdc++.h>")
        call setline(2, "#include \"" . file . "\"  /*  C++ TEST MODE  */")
        call setline(3, "using namespace std;")
    elseif &filetype == 'python'
        let file = expand("%:r")
        exec 'vs TEST.py'
        let g:testmode_wid = win_getid()
        call setline(3, "import " . file . "  # Python TEST MODE")
    elseif &filetype == 'javascript'
        let file = expand("%")
        exec 'vs TEST.html'
        let g:testmode_wid = win_getid()
        call setline(5, "<title>TEST</title><meta charset=\"utf-8\" />")
        call setline(6, "<script src='./". file . "'></script>  <!-- JavaScript TEST MODE -->")
        call setline(9, "<button onclick=\"func(this)\">Click(func)</button><br />")
        call setline(12, "<script>")
        call setline(13, "</script>")
    endif
    call <SID>StatusColor('orange')
endfunc
func! <SID>DebugMode()
    let g:debugmode_key = 1
    call <SID>StatusColor('green')
endfunc

nmap <Leader><Leader>i :call <SID>Text2Html()<CR>
func! <SID>Text2Html()
    exec '%s/^/        <p>/g'
    exec '%s/$/<\/p>\\/g'
    exec '%s/  <p>start<\/p>\\/`\\/g'
    exec '%s/  <p>finish<\/p>\\/`,/g'
    exec '%s/  <p><\/p>\\//g'
endfunc

nmap <Leader><Leader>n :call <SID>CnCharCnt()<CR>
func! <SID>CnCharCnt()
    exec '% s/[\u4E00-\u9FCC]/&/g'
endfunc

let g:workspace = '~/'
nmap gc :call <SID>Chdir()<CR>
func! <SID>Chdir()
    let g:workspace = getcwd()
    set autochdir
    if expand('%:e') == 'h' && &ft == 'c'
        set nospr
        exec 'vs ../src/' . expand('%:r') . '.c'
        set spr
    elseif expand('%:e') == 'c'
        set nospr
        exec 'vs ../include/' . expand('%:r') . '.h'
        set spr
    endif
    echo 'Curdir: ' . getcwd()
endfunc

nmap gw :call <SID>Work()<CR>
func! <SID>Work()
    exec 'cd ' . g:workspace
    echo 'Workspace: ' . getcwd()
endfunc

" ============================================= "
" ================== Plugins ================== "
" ============================================= "
if g:plugtype
    call plug#begin($VIMHOME . '/bundle')
else
    silent! call plug#begin($VIMHOME . '/bundle')
endif
" Plug 'gmarik/Vundle.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'tmhedberg/SimpylFold'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'lilydjwg/fcitx.vim'
Plug 'lilydjwg/colorizer', {'for': ['css']}
" Plug 'skywind3000/quickmenu.vim'
" Plug 'joker1007/vim-markdown-quote-syntax'
" Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
if g:plugtype
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
" Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets', {'for': 'none'}
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
endif
call plug#end()

" NerdTree
map <F4> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeWinPos = 'left'
let g:NERDTreeSize = 30
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeHidden = 0

" SimpylFold
let g:SimpylFold_docstring_preview = 1

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_color_term = 251
let g:indentLine_color_gui = '#c6c6c6'
if &filetype == 'python'
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']
else
  let g:indentLine_char='¦'
endif

" Tabular -> :Tab/=[symbol]<CR>

" Coc
let g:coc_disable_startup_warning = 1
inoremap <silent><expr> <C-Space> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
if g:plugtype
    nmap <silent><BS> <Plug>(coc-diagnostic-next)
else
    nnoremap <expr><BS> (foldlevel(line('.'))>0) ? 'zaj' : 'jza'
endif
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" Tagbar
nnoremap T :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 45
let g:tagbar_left = 0
let g:tagbar_aotofocus = 1

" Jedi
" let g:jedi#completions_enabled=0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = '<C-Space>'
let g:jedi#show_call_signatures = '1'
" auto FileType python,pyrex setlocal completeopt-=preview

" Surround
" VISUAL S+<symbol> add surround
" ds delete surround
" cs replace surround
" ys add surround

" UltiSnips
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsSnippetDirectories = [$VIMHOME . '/ultisnips']

" ============================================= "
" Welcome
func! <SID>Welcome()
    echo 'Hello, ' . $USER . '~    '
        \. (has('win32') ? 'Win32' : (has('win64') ? 'Win64' : 'Linux'))
        \. '(' . (has('gui_running') ? 'GUI)  ' : 'Term)  ')
        \. (has('nvim') ? '*Neovim ' : 'Vim8 ')
        \. (g:plugtype ? 'Full ver.  ' : 'Simple ver.  ')
        \. toupper(g:colors_name) . '('.&background.')'
        \. '  ' . strftime('%Y-%m-%d %T')
endfunc
auto VimEnter * call <SID>Welcome()
" exec 'so ' . $VIMHOME .'/autoload/rinz.vim'
" call <SID>Welcome()
" ============================================= "
finish     " Last Change: 2021.02.25 08:55:20   "
"  _____ _          _____           _           "
" |_   _| |__   ___| ____|_ __   __| |          "
"   | | | '_ \ / _ \  _| | '_ \ / _` |          "
"   | | | | | |  __/ |___| | | | (_| |    2021  "
"   |_| |_| |_|\___|_____|_| |_|\__,_|  Feb.24  "
" vim:fenc=utf-8 ff=unix ft=vim
