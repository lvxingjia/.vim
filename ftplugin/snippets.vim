" snippets

setlocal noexpandtab
setlocal tabstop=8 shiftwidth=8 softtabstop=8

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

inoremap <Plug><C-j> <CR><space><Esc>vr<c-i>a
inoremap <Plug><C-k> <CR><space><Esc>vr<c-i>a
inoremap <Plug><C-g> ()<Esc>i
