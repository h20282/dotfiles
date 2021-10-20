set hls
set nu
hi MatchParen ctermbg=Blue guibg=lightblue


set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent



autocmd BufNewFile *.cpp 0r ~/.vimfiles/template.cpp


inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

