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

set noswapfile
let g:auto_save=1
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI", "CursorHoldI", "CompleteDone"]

set clipboard+=unnamedplus


colo desert

autocmd BufNewFile *.cpp 0r ~/.vimfiles/template.cpp
autocmd BufNewFile conanfile.txt 0r ~/.vimfiles/conanfile.txt
autocmd BufNewFile CMakeLists.txt 0r ~/.vimfiles/CMakeLists.txt



" 复制到Windows剪切板
vmap ;y : !/mnt/c/Windows/System32/clip.exe<cr>u''

let g:clang_format#auto_format_on_insert_leave=1	"退出插入模式时自动格式化

" 文件树
map <F3> :NvimTreeToggle<CR>

map <F4> :A <CR>
map <F5> :w<ESC>:!rm a.out;clear; g++ -std=c++11 % -lmysqlclient; ./a.out;<CR>
inoremap jk <ESC>
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

Plug 'vim-scripts/a.vim'

Plug 'neoclide/coc.nvim', {'tag': 'v0.0.81'}

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
    nnoremap <Space><Space> :Telescope<CR>
endif

Plug 'voldikss/vim-floaterm'
let g:floaterm_autoclose=1
let g:floaterm_autoinsert=1
let g:floaterm_width=0.9
let g:floaterm_height=0.9
if has('win32')
    let g:floaterm_shell = 'powershell'
else
    let g:floaterm_shell = 'zsh'
endif
let g:floaterm_keymap_toggle = '<c-q>'

Plug 'tpope/vim-surround'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'peterhoeg/vim-qml'

Plug 'tpope/vim-commentary'

Plug 'airblade/vim-gitgutter'
nmap gu :GitGutterUndoHunk<CR>
set updatetime=100

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'easymotion/vim-easymotion'
nmap gs <Plug>(easymotion-s2)

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
let g:VM_theme='olive'
let g:VM_leader='\'
let g:VM_maps = {}
let g:VM_maps["Select All"] = '\a'

Plug 'morhetz/gruvbox'

Plug 'Yggdroot/indentLine'

Plug 'frazrepo/vim-rainbow'
let g:rainbow_active = 1

"Plug 'sheerun/vim-polyglot'

Plug 'jiangmiao/auto-pairs'

Plug 'voldikss/vim-translator'
nmap <C-T> :Translate<CR>

call plug#end()
source ~/.vim/config/plugin/coc.vim
map <M-m> :MarkdownPreview<CR>

lua require'nvim-tree'.setup {}

set termguicolors
" -- Attaches to every FileType mode
cnoreabbrev C ColorizerToggle
lua require'colorizer'.setup {}
colo gruvbox
