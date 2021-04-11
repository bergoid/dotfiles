" Fuzzy file selection tools

" vim should have 3 different file-open dialogs:
"
" v 1. fzf in CWD
" . 2. fzf on file history
" . 3. fzf-like hierarchical file browsing from CWD (*)
"
" Proposed keyboard shortcuts:
"
" v 1. F2
" . 2. Shift + F2
" . 3. Ctrl + F2
"
" v Show/hide quickfix window : F4
" v If quickfix window was not present:
"     multiple files selected?
"         v yes -> show (only) the selected files in new quickfix window
"         v no -> just open the file in vim
"               --> will be present in the hidden qf window
" v If quickfix window was already present:
"     v add selected file(s) to the list
"
" (*) https://github.com/ggVGc/fzf_browser
"
" . A 4th dialog:
"   . 4. fzf on the current contents of quickfix window (Ctrl + F6)
"       . no multi-select
"           --> use:
    "               dmenu -i -b -l 40
"               for easy identification of single-select
"
" . Paths should be made absolute before adding them to quickfix
"
" . After adding files to the QF, jump to the first file that was selected for
"   addition
"
" . With option 3, if a file with a specific extension is selected (e.g. .qfix),
"   the file is not opened in the buffer, but its contents are loaded into (or added to)
"   the quickfix window.
"       . Multiple .qfix files can be selected too
"       . Ctrl-F4: dialog from option 3 (or 1 ?) but only showing .qfix files
"
" . A history of selections (single- or multi-file) is kept somewhere
"   . Shift-F4: browse that history with fzf + preview
"       . Selections are shown as:
"           . single file: full path to file
"           . multiple files: between brackets & commas, full paths to all files on
"             a single line: [path1, path2, ..., pathN]
"           . preview window: all paths, one per line


" Returns:
"   true if quickfix window is open
"   false otherwise
function! IsQuickfixOpen() abort

    return len(filter(getwininfo(), 'v:val.quickfix && !v:val.loclist')) > 0

endfunction


" Show quickfix window
function! ShowQuickfix() abort

    " Store path to current file
    let l:openedfile=expand('%:p')

    " Show QF window
    copen

    " Hide QF statusline
    set laststatus=0

    if empty(getqflist())

        if !empty(l:openedfile)

            " Empty QF but opened file? -> Add the file to the QF.
            set errorformat=%f
            let l:openedfilelist=[l:openedfile]
            caddexpr l:openedfilelist
            " QF is non-empty now. Jump to current error.
            cc

        endif

    else

        " Only jump to (current) error with non-empty QF
        cc

    endif

endfunction


" Toggle visibility of quickfix window
function! ToggleQuickfix() abort

    if IsQuickfixOpen()
        cclose
    else
        call ShowQuickfix()
    endif

endfunction


" Launch fzf and open selected file(s)
function! FuzzyFileSelect() abort

    if !executable('fzf')
        return
    endif

    try
        update
    catch
        call PrintError("Could not save changes")
        return
    endtry

    let output_file = tempname()

    silent execute '!fzf -m > ' . output_file | redraw!

    let selected_files = readfile(output_file)

    call delete(output_file)

    if empty(selected_files)
        return
    endif

    set errorformat=%f

    if IsQuickfixOpen()

        " Add selected_files to contents of quickfix
        caddexpr selected_files

        " Jump to current error (needed when QF was empty before)
        cc

    else

        " Reset contents of quickfix with selected_files
        cexpr selected_files

        " More than 1 file? Show quickfix window.
        if len(selected_files) > 1
            call ShowQuickfix()
        endif

    endif

endfunction
