" Recursively map key to a sequence in all modes
function! RMapam(key, sequence)
    let seq_esc = a:sequence
    execute 'nmap ' . a:key . ' ' . seq_esc
    execute 'imap ' . a:key . ' <esc>' . seq_esc
    execute 'vmap ' . a:key . ' <esc><esc>' . seq_esc
    execute 'cmap ' . a:key . ' <esc><esc>' . seq_esc
endfunction

" Escape sequence mappings for function keys

call RMapam('<ESC>OP', '<F1>')
call RMapam('<ESC>OQ', '<F2>')
call RMapam('<ESC>OR', '<F3>')
call RMapam('<ESC>OS', '<F4>')
call RMapam('<ESC>[15~', '<F5>')
call RMapam('<ESC>[17~', '<F6>')
call RMapam('<ESC>[18~', '<F7>')
call RMapam('<ESC>[19~', '<F8>')
call RMapam('<ESC>[20~', '<F9>')
call RMapam('<ESC>[21~', '<F10>')
call RMapam('<ESC>[23~', '<F11>')
call RMapam('<ESC>[24~', '<F12>')

call RMapam('<ESC>[1;2P', '<S-F1>')
call RMapam('<ESC>[1;2Q', '<S-F2>')
call RMapam('<ESC>[1;2R', '<S-F3>')
call RMapam('<ESC>[1;2S', '<S-F4>')
call RMapam('<ESC>[15;2~', '<S-F5>')
call RMapam('<ESC>[17;2~', '<S-F6>')
call RMapam('<ESC>[18;2~', '<S-F7>')
call RMapam('<ESC>[19;2~', '<S-F8>')
call RMapam('<ESC>[20;2~', '<S-F9>')
call RMapam('<ESC>[21;2~', '<S-F10>')
call RMapam('<ESC>[23;2~', '<S-F11>')
call RMapam('<ESC>[24;2~', '<S-F12>')

call RMapam('<ESC>[1;5P', '<C-F1>')
call RMapam('<ESC>[1;5Q', '<C-F2>')
call RMapam('<ESC>[1;5R', '<C-F3>')
call RMapam('<ESC>[1;5S', '<C-F4>')
call RMapam('<ESC>[15;5~', '<C-F5>')
call RMapam('<ESC>[17;5~', '<C-F6>')
call RMapam('<ESC>[18;5~', '<C-F7>')
call RMapam('<ESC>[19;5~', '<C-F8>')
call RMapam('<ESC>[20;5~', '<C-F9>')
call RMapam('<ESC>[21;5~', '<C-F10>')
call RMapam('<ESC>[23;5~', '<C-F11>')
call RMapam('<ESC>[24;5~', '<C-F12>')

call RMapam('<ESC>[1;3P', '<M-F1>')
call RMapam('<ESC>[1;3Q', '<M-F2>')
call RMapam('<ESC>[1;3R', '<M-F3>')
call RMapam('<ESC>[1;3S', '<M-F4>')
call RMapam('<ESC>[15;3~', '<M-F5>')
call RMapam('<ESC>[17;3~', '<M-F6>')
call RMapam('<ESC>[18;3~', '<M-F7>')
call RMapam('<ESC>[19;3~', '<M-F8>')
call RMapam('<ESC>[20;3~', '<M-F9>')
call RMapam('<ESC>[21;3~', '<M-F10>')
call RMapam('<ESC>[23;3~', '<M-F11>')
call RMapam('<ESC>[24;3~', '<M-F12>')

" tmux workaround
call RMapam('<ESC><ESC>OP', '<M-F1>')
call RMapam('<ESC><ESC>OQ', '<M-F2>')
call RMapam('<ESC><ESC>OR', '<M-F3>')
call RMapam('<ESC><ESC>OS', '<M-F4>')
call RMapam('<ESC><ESC>[15~', '<M-F5>')
call RMapam('<ESC><ESC>[17~', '<M-F6>')
call RMapam('<ESC><ESC>[18~', '<M-F7>')
call RMapam('<ESC><ESC>[19~', '<M-F8>')
call RMapam('<ESC><ESC>[20~', '<M-F9>')
call RMapam('<ESC><ESC>[21~', '<M-F10>')
call RMapam('<ESC><ESC>[23~', '<M-F11>')
call RMapam('<ESC><ESC>[24~', '<M-F12>')
