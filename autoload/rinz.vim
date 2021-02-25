let g:rinz#str = 'Hello, Rinz'
func! rinz#hello()
    echo 'Hello, ' . $USER . '~    '
        \. (has('win32') ? 'Win32' : (has('win64') ? 'Win64' : 'Linux'))
        \. '(' . (has('gui_running') ? 'GUI)  ' : 'Term)  ')
        \. (has('nvim') ? '*Neovim ' : 'Vim8 ')
        \. (g:plugtype ? 'Full ver.  ' : 'Simple ver.  ')
        \. toupper(g:colors_name) . '('.&background.')'
        \. '  ' . strftime('%Y-%m-%d %T')
endfunc
call rinz#hello()
