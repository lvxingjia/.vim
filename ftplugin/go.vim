" go

setlocal foldmethod=syntax
setlocal noexpandtab
setlocal tabstop=4 shiftwidth=4 softtabstop=4

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

inoremap <Plug><C-j> <End><Space>{<CR>}<Esc>O
inoremap <Plug><C-k> <End><C-m>
inoremap <Plug><C-g> ()<Esc>i
