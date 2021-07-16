" HTML

setlocal tabstop=2 shiftwidth=2 softtabstop=2

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap < <><Esc>i

inoremap <Plug><C-j> <End><Space>{<CR>}<Esc>O
inoremap <Plug><C-k> <End>;<C-m>
inoremap <Plug><C-g> <Esc>T<ve"0yA</><Esc>"0PF<i
