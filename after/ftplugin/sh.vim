if executable('shfmt')
    let &l:formatprg='shfmt -s -ln bash -i ' . &l:shiftwidth . ' -bn -ci -sr -kp'
endif

" usage: shfmt [flags] [path ...]
"
" shfmt formats shell programs. If the only argument is a dash ('-') or no
" arguments are given, standard input will be used. If a given path is a
" directory, all shell scripts found under that directory will be used.
"
"   --version  show version and exit
"
"   -l,  --list      list files whose formatting differs from shfmt's
"   -w,  --write     write result to file instead of stdout
"   -d,  --diff      error with a diff when the formatting differs
"   -s,  --simplify  simplify the code
"   -mn, --minify    minify the code to reduce its size (implies -s)
"
" Parser options:
"
"   -ln, --language-dialect str  bash/posix/mksh/bats, default "auto"
"   -p,  --posix                 shorthand for -ln=posix
"   --filename str               provide a name for the standard input file
"
" Printer options:
"
"   -i,  --indent uint       0 for tabs (default), >0 for number of spaces
"   -bn, --binary-next-line  binary ops like && and | may start a line
"   -ci, --case-indent       switch cases will be indented
"   -sr, --space-redirects   redirect operators will be followed by a space
"   -kp, --keep-padding      keep column alignment paddings
"   -fn, --func-next-line    function opening braces are placed on a separate line
"
" Utilities:
"
"   -f, --find   recursively find all shell files and print the paths
"   --tojson     print syntax tree to stdout as a typed JSON
"
" For more information, see 'man shfmt' and https://github.com/mvdan/sh.
