" yaml

syntax off
setlocal foldmethod=indent
setlocal noexpandtab

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap < <

inoremap <Plug><C-j> <C-m>
inoremap <Plug><C-k> <End><C-m>
inoremap <Plug><C-g> ()<Esc>i
