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

" from url: https://www.cnblogs.com/vactor/p/5046800.html
" 输入一个字符时，如果下一个字符也是括号，则删除它，避免出现重复字符
function! RemoveNextDoubleChar(char)
    let l:line = getline(".")
    let l:next_char = l:line[col(".")] " 取得当前光标后一个字符
     
    if a:char == l:next_char
        execute "normal! l"
    else
        execute "normal! i" . a:char . ""
    end
endfunction

inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
" inoremap " <ESC>:call RemoveNextDoubleChar('"')<CR>a

