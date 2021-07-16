" scheme

setlocal lisp
setlocal tabstop=2 shiftwidth=2 softtabstop=2

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' '()<Esc>i

inoremap <Plug><C-j> <Esc>^%a<CR>
inoremap <Plug><C-k> <ESc>jI
inoremap <Plug><C-g> ()<Esc>i
