" Mock implementation of Mapam
" Displays the pressed key on the first line
function! Mapam(key, sequence)
    let seq_esc = 'ggO' . a:key . '<esc>'
    execute 'nnoremap ' . a:key . ' ' . seq_esc
    execute 'inoremap ' . a:key . ' <esc>' . seq_esc
    execute 'vnoremap ' . a:key . ' <esc><esc>' . seq_esc
    execute 'cnoremap ' . a:key . ' <esc><esc>' . seq_esc
endfunction

" Map all fkeys to empty sequence

call Mapam('<F1>', '')
call Mapam('<F2>', '')
call Mapam('<F3>', '')
call Mapam('<F4>', '')
call Mapam('<F5>', '')
call Mapam('<F6>', '')
call Mapam('<F7>', '')
call Mapam('<F8>', '')
call Mapam('<F9>', '')
call Mapam('<F10>', '')
call Mapam('<F11>', '')
call Mapam('<F12>', '')

call Mapam('<S-F1>', '')
call Mapam('<S-F2>', '')
call Mapam('<S-F3>', '')
call Mapam('<S-F4>', '')
call Mapam('<S-F5>', '')
call Mapam('<S-F6>', '')
call Mapam('<S-F7>', '')
call Mapam('<S-F8>', '')
call Mapam('<S-F9>', '')
call Mapam('<S-F10>', '')
call Mapam('<S-F11>', '')
call Mapam('<S-F12>', '')

call Mapam('<C-F1>', '')
call Mapam('<C-F2>', '')
call Mapam('<C-F3>', '')
call Mapam('<C-F4>', '')
call Mapam('<C-F5>', '')
call Mapam('<C-F6>', '')
call Mapam('<C-F7>', '')
call Mapam('<C-F8>', '')
call Mapam('<C-F9>', '')
call Mapam('<C-F10>', '')
call Mapam('<C-F11>', '')
call Mapam('<C-F12>', '')

call Mapam('<M-F1>', '')
call Mapam('<M-F2>', '')
call Mapam('<M-F3>', '')
call Mapam('<M-F4>', '')
call Mapam('<M-F5>', '')
call Mapam('<M-F6>', '')
call Mapam('<M-F7>', '')
call Mapam('<M-F8>', '')
call Mapam('<M-F9>', '')
call Mapam('<M-F10>', '')
call Mapam('<M-F11>', '')
call Mapam('<M-F12>', '')
