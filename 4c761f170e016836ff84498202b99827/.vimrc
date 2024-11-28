set hls
set nu
hi MatchParen ctermbg=Blue guibg=lightblue
hi Search ctermbg=220

set fencs=utf-8,gbk,utf-16,utf-32,ucs-bom


set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent



autocmd BufNewFile *.cpp 0r ~/.vimfiles/template.cpp
autocmd BufNewFile conanfile.txt 0r ~/.vimfiles/conanfile.txt
autocmd BufNewFile CMakeLists.txt 0r ~/.vimfiles/CMakeLists.txt


inoremap ( ()<Esc>i
inoremap [ []<Esc>i
" inoremap < <><Esc>i
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
        execute "normal! a" . a:char . ""
    end
endfunction

inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
imap {<CR> {}<ESC>i<CR><ESC>O
" inoremap " <ESC>:call RemoveNextDoubleChar('"')<CR>a

let g:clang_format#auto_format_on_insert_leave=1	"退出插入模式时自动格式化

" 文件树
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

map <F4> :A <CR>
map <F5> :w<ESC>:!rm a.out;clear; g++ -std=c++11 % -lmysqlclient; ./a.out;<CR>
inoremap jk <ESC>
map <C-k> :ClangFormat<CR>
let g:clang_format#auto_format_on_insert_leave=0


" 插件
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'skywind3000/asyncrun.vim'
 
call plug#end()
source ~/.vim/config/plugin/coc.vim
map <M-m> :MarkdownPreview<CR>
