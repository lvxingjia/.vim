" viminfo

setlocal cursorline

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

inoremap <Plug><C-j> <C-m>
inoremap <Plug><C-k> <End><C-m>
inoremap <Plug><C-g> \%(\)<Esc>hi
