if exists('b:current_syntax')
    finish
endif

runtime! syntax/go.vim
let b:current_syntax = 'risor'
