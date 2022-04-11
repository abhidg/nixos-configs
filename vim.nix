{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    settings = {
      background = "dark";
      mouse = "a";
      backupdir = [ "~/tmp" ];
      expandtab = true;
      hidden = true;
      ignorecase = true;
      modeline = true;
      number = true;
      shiftwidth = 4;
      smartcase = true;
      tabstop = 4;
    };
    plugins = with pkgs.vimPlugins; [
      vim-pandoc
      vim-pandoc-syntax
      vim-polyglot
      vim-commentary
      vim-fugitive
      vim-rhubarb
      fzf-vim
      vim-sneak
      editorconfig-vim
      ale
      vim-gutentags
    ];
  };

  programs.vim.extraConfig = ''
let mapleader = "\<space>"
let maplocalleader = " "
syntax on
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#command#latex_engine = "pdflatex"
let g:pandoc#command#autoexec_on_writes = 1
let g:pymode_python = 'python3'
let g:pymode_rope = 0
let g:pymode_lint_checkers = ['pyflakes']
let g:pymode_warnings = 1
let g:ale_linters = {'python': ['flake8']}
let g:sneak#s_next = 1
hi Normal ctermbg=none
highlight NonText ctermbg=none
set nocompatible
inoremap hh <ESC>

" Terminal setup.
set vb t_vb=""				" No beeps or visual bells.
if &term == "xterm"
	set t_kD=			" Make delete work in xterm.
	set t_kb=			" And backspace too.
endif

" window splits
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>

nnoremap <leader>. :Tags<cr>
nnoremap <C-P> :GFiles<cr>

let g:ale_sign_column_always = 1

set autochdir
au FileType crontab set nobackup nowritebackup
" How things look.
" Syntax colors.
highlight Todo ctermbg=Red ctermfg=Yellow
" Set up the status line so it's colored and always on. Very jedish.
set laststatus=2
set number
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
set statusline=%<%f\ %h%m%r\%=%-14.(%l,%c%V%)\ %P
" highlight StatusLine cterm=none ctermbg=black

" Miscellaneous settings.
set shortmess+=I	" Short messages for intro screen
set textwidth=75
set scrolloff=3
set noicon		" I disable these because they can cause X traffic
set title		" bad over slow links. Plus my shell does it ok.
set nowrap		" don't display long lines wrapped, just scroll over
set showmatch		" highlight matching brackets
set showcmd		" show commands as they're being typed
set incsearch		" incremental searching
set lazyredraw		" don't redraw screen during macros and stuff
set autowrite		" write contents of file before eg, :make
set wildmenu		" display menu of completions
set viewoptions=folds	" save folding state for views
set pastetoggle=<F4>    " sane pasting in terminal vim
set wildmode=longest:full
set lsp=3
set gdefault
set foldmethod=marker
set hlsearch
set nofoldenable
set autoindent
set formatoptions-=t
set showmode
set gcr=n:blinkon0	" no blinking cursor in gvim
set tags=.tags,tags;	" use .tags for tags file; to reduce ls clutter
set nojoinspaces	" don't add spaces after period on gqip
set fileencodings=utf-8
"set termencoding=latin1
set viminfo='20,\"1000 " read/write a .viminfo file, with a larger than usual buffer

" Enable it all.
filetype plugin indent on
"load-plugins

" gutentags
let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ },
      \ }
let g:gutentags_generate_on_new = 1

" tabs
set softtabstop=4

" C++
inoremap <F2> std::
iab ddd #define
iab ii #include
iab iif if (
iab while while (
iab nffs namespace fs = std::filesystem;
iab nusing using namespace
iab vvv std::vector<
iab umop std::unordered_map<
iab umops std::unordered_map<std::string,
iab mmop std::map<
iab mmops std::map<std::string,
iab nns namespace
iab akk std::string
iab vecs std::vector<std::string>
iab vecd std::vector<double>
iab vecf std::vector<float>
iab veci std::vector<int>
iab sss std::stringstream
iab iumop #include <lt>unordered_map>
iab immop #include <lt>map>
iab iarr #include <lt>array>
iab iss #include <lt>string>
iab isss #include <lt>stringstream>
iab ivv #include <lt>vector>
iab ret return
iab mmin std::min(
iab mmax std::max(
iab castu static_cast<unsigned>

" Little spell checker prog.
noremap <C-S> :so `~/vim/vimspell %`<CR><CR>
noremap <F7> :syntax clear SpellErrors<CR>

"save shortcut
map // :nohlsearch<CR>
map <leader>u :update<CR>
map \ :update<CR>
nnoremap Q gqap
nnoremap ; :
vnoremap Q gq

" sane regex
nnoremap / /\v
vnoremap / /\v

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
" Syncing swap files is bad news on laptops with spun down disks.
if system('ls /proc/acpi')
	set swapsync=""
endif

" Abbreviations.
iab 1bf \begin{frame}
iab 1be \begin{equation}
iab 1ee \end{equation}
iab 1bea \begin{eqnarray}
iab 1eea \end{eqnarray}
iab 1ef \end{frame}

iab 1be \begin{equation}
iab 1ee \end{equation}
iab 1bea \begin{eqnarray}
iab 1eea \end{eqnarray}

" Line length for mail
autocmd FileType mail			set textwidth=72
autocmd FileType mail   setlocal fo+=aw
autocmd FileType mail			start
    '';
}
