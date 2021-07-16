" XML

setlocal tabstop=2 shiftwidth=2 softtabstop=2
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap < <><Esc>i

inoremap <Plug><C-j> <Esc>yi<f>a</><Esc>hpF<i
inoremap <Plug><C-k> <End><C-m>
inoremap <Plug><C-g> ()<Esc>i
