hi MatchParen ctermbg=Blue guibg=lightblue
hi Search ctermbg=220

set fencs=utf-8,gbk,utf-16,utf-32,ucs-bom
set hls
set nu
" 缩进相关
set ts=4            " 
set softtabstop=4   " tab 空格数量
set shiftwidth=4    " 自动缩进空格数量
set expandtab
set autoindent

set mouse=a         " 鼠标支持
set noswapfile      " 无.swap
set nowrap          " 不换行

set colorcolumn=81 " 默认突出显示第81列

function! ReadClangFormatColumnLimit()
    " 获取当前文件的目录
    let l:current_file = expand('%:p')
    let l:dirname = fnamemodify(l:current_file, ':h')

    " 拼接 .clang-format 文件的路径
    let l:clang_format_file = l:dirname . '/.clang-format'

    " 检查文件是否存在
    if !filereadable(l:clang_format_file)
        echomsg "Error: .clang-format file not found."
        return
    endif

    " 读取 .clang-format 文件内容
    let l:clang_format_content = readfile(l:clang_format_file)

    " 查找 ColumnLimit 的值
    for l:line in l:clang_format_content
        if l:line =~ 'ColumnLimit'
            let l:column_limit = matchstr(l:line, '\d\+')
            echomsg "ColumnLimit found: " . l:column_limit
            let l:column_limit = l:column_limit+1
            execute 'set colorcolumn=' . l:column_limit
            return
        endif
    endfor

    echomsg "ColumnLimit not found"
endfunction
" 设置colorcolumn为 .clang-format 中的 ColumnLimit+1
call ReadClangFormatColumnLimit()


let g:auto_save=1
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI", "CursorHoldI", "CompleteDone"]

colo desert

autocmd BufNewFile *.cpp 0r ~/.vimfiles/template.cpp
autocmd BufNewFile conanfile.txt 0r ~/.vimfiles/conanfile.txt
autocmd BufNewFile CMakeLists.txt 0r ~/.vimfiles/CMakeLists.txt

" 绑定 Vim剪贴板 和 系统剪贴板 
set clipboard+=unnamedplus
" 复制到Windows剪切板
vmap ;y : !/mnt/c/Windows/System32/clip.exe<cr>u''

if has('win32')
    " 在Linux下打开该选项会导致括号回车异常
    let g:clang_format#auto_format_on_insert_leave=1	"退出插入模式时自动格式化
endif

" 文件树
map <F3> :NvimTreeToggle<CR>
map <Space>t :NvimTreeFindFile<CR>

map <F5> :w<ESC>:!rm a.out;clear; g++ -std=c++11 % -lmysqlclient; ./a.out;<CR>

inoremap jk <ESC>
inoremap <C-b> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-f> <Right>
vnoremap H ^
vnoremap L $
nnoremap H ^
nnoremap L $
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-k> :call CocAction("format")<CR>
map <C-Right> <C-W>>
map <C-Left> <C-W><

cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>


" 插件
call plug#begin('~/.vim/plugged')

" switch header/cpp
Plug 'vim-scripts/a.vim' 
map <F4> :A <CR>

" code completion
Plug 'neoclide/coc.nvim', {'tag': 'v0.0.81'}

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'skywind3000/asyncrun.vim'

" search string
" note: scoop install ripgrep
Plug 'dyng/ctrlsf.vim'
cnoreabbrev F CtrlSF
let g:ctrlsf_backend='rg'
map gf :CtrlSF <C-R><C-W><CR>
map <F2> :CtrlSFToggle<CR>

" for file icons 
Plug 'kyazdani42/nvim-web-devicons'

" file tree
Plug 'kyazdani42/nvim-tree.lua'

" git blamer
Plug 'APZelos/blamer.nvim'
let g:blamer_prefix = '<- '
let g:blamer_date_format = '%Y-%m-%d'
let g:blamer_template = '<committer> <commit-short> <committer-time> <summary>'
cnoreabbrev B BlamerToggle

Plug 'psliwka/vim-smoothie'
let g:smoothie_speed_linear_factor = 15
 
if has("nvim")
    Plug 'nvim-lua/plenary.nvim' | Plug 'nvim-telescope/telescope.nvim'
    nnoremap <Space>f :Telescope find_files<CR>
    nnoremap <Space>s :Telescope grep_string<CR>
    nnoremap <Space>l :Telescope live_grep<CR>
    nnoremap <Space><Space> :Telescope<CR>
endif

" floating terminal
Plug 'voldikss/vim-floaterm'
let g:floaterm_autoclose=1
let g:floaterm_autoinsert=1
let g:floaterm_wintype="vsplit"
let g:floaterm_width=0.6
let g:floaterm_height=0.9
if has('win32')
    let g:floaterm_shell = 'powershell'
else
    let g:floaterm_shell = 'zsh'
endif
let g:floaterm_keymap_toggle = '<c-q>'

" 
Plug 'tpope/vim-surround'

" show color of `#fff`
Plug 'norcalli/nvim-colorizer.lua'

" qml highlight
Plug 'peterhoeg/vim-qml'

" Comment/Uncomment
Plug 'tpope/vim-commentary'
" 设置C语言和C++的注释格式为//开头的单行注释
autocmd FileType c,cpp setlocal commentstring=//\ %s

Plug 'airblade/vim-gitgutter'
nmap gu :GitGutterUndoHunk<CR>
nmap gt :GitGutterLineHighlightsToggle<CR>
nmap gs :GitGutterStageHunk<CR>
nmap gn :GitGutterNextHunk<CR>
nmap gN :GitGutterPrevHunk<CR>
set updatetime=100

" for gv.vim
Plug 'tpope/vim-fugitive'

" view git history
Plug 'junegunn/gv.vim'

"" 
"Plug 'easymotion/vim-easymotion'
"nmap gs <Plug>(easymotion-s2)

" multi edit cursor 
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
let g:VM_theme='olive'
let g:VM_leader='\'
let g:VM_maps = {}
let g:VM_maps["Select All"] = '\a'

" Theme
Plug 'morhetz/gruvbox'

" 缩进线
Plug 'Yggdroot/indentLine'

" 彩虹括号
Plug 'frazrepo/vim-rainbow'
let g:rainbow_active = 1

"Plug 'sheerun/vim-polyglot'

" 括号对
Plug 'jiangmiao/auto-pairs'

" translator
Plug 'voldikss/vim-translator'
nmap <C-T> :Translate<CR>

" vim-debugger
Plug 'puremourning/vimspector'
nmap <M-i> :call vimspector#StepInto()<CR>
nmap <M-o> :call vimspector#StepOut()<CR>
nmap <M-l> :call vimspector#Launch()<CR>
nmap <M-b> :call vimspector#ToggleBreakpoint()<CR>
nmap <M-c> :call vimspector#Continue()<CR>
nmap <M-r> :call vimspector#Reset()<CR>

Plug 'jakar/vim-python-syntax'
let python_highlight_all = 1

Plug 'fidian/hexmode'
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.png,*.jpg,*.wav,*.pcm,*.obj,*.dll'

call plug#end()
if has_key(plugs, 'coc.nvim')
    source ~/.vim/config/plugin/coc.vim
endif
map <M-m> :MarkdownPreview<CR>

if has("nvim")
    lua require'nvim-tree'.setup { actions = { open_file = { resize_window = false } } }
endif

set termguicolors
" -- Attaches to every FileType mode
cnoreabbrev C ColorizerToggle
if has("nvim")
    lua require'colorizer'.setup {}
endif
colo gruvbox
