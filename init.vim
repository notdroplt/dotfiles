
""" setters globais ====================================================
syntax on				" ligar syntax highlighting
set nu					" número de linhas
set tabstop=4			" /
set softtabstop=4		" /
set shiftwidth=4		" / configurações para usar tab = 4 espaços
set smarttab			" /
set smartindent			" /
set hidden				" esconder o buffer atual
set incsearch			" pesquisa incremental
set ignorecase			" ignorar maiúsculas/minúsculas em pesquisas
set smartcase			"
set scrolloff=8			" número de linhas mantidas em cima/baixo do cursor
set signcolumn=yes		"
set cmdheight=3			" altura da linha de comando interna
set updatetime=125		" tempo para considerar mudanças
set encoding=utf-8		" encoding padrão
set nobackup			" sem arquivos padrão
set nowritebackup		" sem arquivos de backup
set autoread
set mouse=a
filetype on
filetype plugin on
filetype indent on

""" plugins

call plug#begin()
Plug 'sainnhe/sonokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'davidhalter/jedi-vim'
Plug 'stevearc/vim-arduino'
Plug 'wuelnerdotexe/vim-astro'
call plug#end()

""" remapeamentos

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <C-a> :NERDTreeToggle<CR>
noremap <F3> :noh<CR><CR>
nnoremap tp :!python %<CR>

""" comandos automáticos

""" temas

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_current_word = 'bold'
colorscheme sonokai

if (has("nvim")) "fundo transparente
	highlight Normal guibg=NONE ctermbg=NONE
	highlight EndOfBuffer guibg=NONE ctermbg=NONE
endif

let g:airline_theme = 'sonokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1



let g:coc_global_extensions = ['coc-snippets', 'coc-explorer', 'coc-clangd']
let g:coc_default_semantic_highlight_groups = 1

""" Snippets do Coc


let g:ale_linters = {
\	'python': ['flake8', 'pyright', 'bandit'],
\	'cpp': [],
\	'c': [],
\}

let g:ale_c_clangformat_options = '"-style={
\ BasedOnStyle: google,
\ IndentWidth: 4,
\ ColumnLimit: 128,
\ AllowShortBlocksOnASingleLine: Always,
\ AllowShortFunctionsOnASingleLine: Inline,
\ FixNamespaceComments: true,
\ ReflowComments: false,
\ }"'

let g:ale_python_flake8_options = '--max-line-length=128 --extend-ignore=E203'

let g:ale_fixers = {
\	'*': ['trim_whitespace'],
\	'python': ['black', 'isort'],
\	'cpp': ['clang-format'],
\	'c': ['clang-format'],
\}

let g:ale_python_black_options = '--line-legnth 128'

let g:ale_python_isort_options = '--profile black -l 128'

let g:ale_fix_on_save = 1

""" astro

let g:astro_typescript = 'enable'
