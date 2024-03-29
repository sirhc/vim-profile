let b:runscript_interpreter = 'asciidoc'

function! AsciidocFold()
    let line  = getline(v:lnum)
    let depth = match(line, '\(^=\+\)\@<=\( .*$\)\@=')

    if depth > 0
        return '>' . depth
    endif

    return '='
endfunction

if has('folding') && exists('g:asciidoc_folding')
    setlocal foldlevelstart=1
    setlocal foldlevel=1
    setlocal foldexpr=AsciidocFold()
    setlocal foldmethod=expr
endif
