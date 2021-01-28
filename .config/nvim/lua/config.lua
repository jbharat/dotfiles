local nvim = vim.api
local g = vim.g
local cmd = vim.cmd

nvim.nvim_command('set showtabline=0')
nvim.nvim_command('set number')
nvim.nvim_command('set hidden')
nvim.nvim_command('set tabstop=2 softtabstop=2')
nvim.nvim_command('set shiftwidth=2')
nvim.nvim_command('set expandtab')
nvim.nvim_command('set smartindent')
nvim.nvim_command('set ignorecase')
nvim.nvim_command('set smartcase')
nvim.nvim_command('set noswapfile')
nvim.nvim_command('set nobackup')
nvim.nvim_command('set undodir=~/.vim/undodir')
nvim.nvim_command('set undofile')
nvim.nvim_command('set incsearch')
nvim.nvim_command('set scrolloff=8')
nvim.nvim_command('set noshowmode')
nvim.nvim_command('set completeopt=menuone,noinsert,noselect')
nvim.nvim_command('set cmdheight=1')
nvim.nvim_command('set updatetime=250')
nvim.nvim_command('set shortmess+=cI')
nvim.nvim_command('set colorcolumn=0')
nvim.nvim_command('set termguicolors')
nvim.nvim_command('set list')
nvim.nvim_command('set listchars=tab:>-,eol:¬,extends:»,precedes:«')
nvim.nvim_command('set dir=~/.vim/swap//')
nvim.nvim_command('set showmatch')
nvim.nvim_command('set cursorline')
nvim.nvim_command('set lazyredraw')
nvim.nvim_command('set redrawtime=10000')
nvim.nvim_command('set splitbelow')
nvim.nvim_command('set splitright')
nvim.nvim_command('set nowritebackup')
-- nvim.nvim_command('set grepprg=rg --vimgrep --no-heading --smart-case --hidden')
nvim.nvim_command('set shell=/bin/zsh')
nvim.nvim_command('set nowrap')
nvim.nvim_command('set foldmethod=manual')
nvim.nvim_command('set foldnestmax=10')
nvim.nvim_command('set foldlevel=2')
nvim.nvim_command('set inccommand=split')
nvim.nvim_command('set signcolumn=yes')
nvim.nvim_command('set wildignorecase')
nvim.nvim_command('set rtp+=/usr/local/opt/fzf')
nvim.nvim_command('syntax enable')
nvim.nvim_command('filetype plugin indent on')
nvim.nvim_command('set encoding=UTF-8')

g.mapleader = " "

cmd('colorscheme night-owl')

cmd('let $TERM = "alacritty"')
cmd('let $GIT_EDITOR = "nvr -cc split --remote-wait"')

cmd("highlight default link EndOfLineSpace ErrorMsg")
cmd("match EndOfLineSpace / \\+$/")

vim.g["sneak#use_ic_scs"] = 1
vim.g["sneak#target_labels"] = "asdfjkl;ghqweruioptyzxcvnmb"
