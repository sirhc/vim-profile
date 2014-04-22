setlocal cinwords=
setlocal comments-=s1:/*,mb:*,ex:*/,://,fb:-
setlocal complete=k~/.vim/complete/mail.list,.,w,b,u,t,i
setlocal dictionary+=/usr/share/dict/words
setlocal formatoptions+=waj
setlocal notitle
setlocal textwidth=72

map <buffer> <C-J> !G perl -MText::Autoformat -e 'autoformat{mail=>1}'<CR>
map <buffer> <Leader>s Go-- <Esc>:r! ~/bin/signature<CR>
map <buffer> -- A<CR><CR><CR><Esc>k5i-----cut-----<Esc><CR><CR>
map <buffer> ] 0i> <Esc><CR>
