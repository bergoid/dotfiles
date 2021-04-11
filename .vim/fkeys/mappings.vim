" Map key to a sequence in all modes
function! Mapam(key, sequence)
    let seq_esc = a:sequence
    execute 'nnoremap ' . a:key . ' ' . seq_esc
    execute 'inoremap ' . a:key . ' <esc>' . seq_esc
    execute 'vnoremap ' . a:key . ' <esc><esc>' . seq_esc
    execute 'cnoremap ' . a:key . ' <esc><esc>' . seq_esc
endfunction

" F2 : save & browse current directory
call Mapam('<F2>', ':call FuzzyFileSelect()<CR>')

" F4 : toggle visibility of quickfix window
call Mapam('<F4>', ':call ToggleQuickfix()<CR>')

" F5 : increase height of current window
call Mapam('<F5>', ':res +1<CR>')

" Shift+F5 : decrease height of current window
call Mapam('<S-F5>', ':res -1<CR>')

" F6 : goto to next line in quickfix window
call Mapam('<F6>', ':update<CR>:cn<CR>zz')

" Shift-F6 : goto previous line in quickfix window
call Mapam('<S-F6>', ':update<CR>:cp<CR>zz')

" F7 : make
"call Mapam('<F7>', ':make -k<CR>:cw<CR>')

" F11 : Clear highlight after search
call Mapam('<F11>', ':noh<CR>')

" Alt-F11 : Delete trailing whitespace on all lines
" and replace all tabs with 4 spaces
call Mapam('<M-F11>', 'ma:%s/\s\+$//ge\|%s/\t/    /ge<CR>`a')

" Shift+F11 : Clear buffer & go to insert mode
"call Mapam('<S-F11>', 'ggdGi')

" F12 : save & continue
call Mapam('<F12>', ':update<CR>')

" Alt-F12 : save & exit
call Mapam('<M-F12>', 'ZZ')

" Ctrl-F12 : exit
call Mapam('<C-F12>', 'ZQ')

" Shift-F12 : reload file
call Mapam('<S-F12>', ':e!<CR>')

