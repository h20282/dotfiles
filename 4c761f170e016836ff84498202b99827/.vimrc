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
set mouse=a

set clipboard+=unnamedplus


colo desert

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
map <F3> :NvimTreeToggle<CR>

map <F4> :A <CR>
map <F5> :w<ESC>:!rm a.out;clear; g++ -std=c++11 % -lmysqlclient; ./a.out;<CR>
inoremap jk <ESC>
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-k> :ClangFormat<CR>
map <C-Right> <C-W>>
map <C-Left> <C-W><
let g:clang_format#auto_format_on_insert_leave=0


" 插件
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'skywind3000/asyncrun.vim'
" scoop install ripgrep
Plug 'dyng/ctrlsf.vim'
cnoreabbrev F CtrlSF
let g:ctrlsf_backend='rg'
map gf :CtrlSF <C-R><C-W><CR>
map <F2> :CtrlSFToggle<CR>

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'APZelos/blamer.nvim'
cnoreabbrev B BlamerToggle

Plug 'psliwka/vim-smoothie'
let g:smoothie_speed_linear_factor = 30
 
if has("nvim")
    Plug 'nvim-lua/plenary.nvim' | Plug 'nvim-telescope/telescope.nvim'
    nnoremap <Space>f :Telescope find_files<CR>
    nnoremap <Space>s :Telescope grep_string<CR>
endif

call plug#end()
source ~/.vim/config/plugin/coc.vim
map <M-m> :MarkdownPreview<CR>

lua require'nvim-tree'.setup {}
