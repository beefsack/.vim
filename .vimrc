call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'dracula/vim'
Plug 'hhvm/vim-hack'
Plug 'tpope/vim-sleuth' " Indentation detection
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-fugitive' " Git in Airline
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'neomake/neomake'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

call plug#end()

filetype plugin indent on
syntax on
set tabstop=4
set cursorline
set cc=80
set ignorecase
set smartcase
set laststatus=2
set mouse=a
set backspace=indent,eol,start
set wildmode=longest,full
set wildmenu
set timeoutlen=1000 ttimeoutlen=0
set clipboard=unnamedplus

color dracula
highlight Pmenu ctermbg=238 guibg=gray40

let mapleader=","
nnoremap <leader>f :call fzf#run({'source': 'ag -g ""', 'sink': 'e', 'down': '~40%'})<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader>r :Tags<CR>
nnoremap <leader>s :Ag<Space>

if has('gui_running')
  set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 12
  set guioptions -=m
  set guioptions -=T
  set guioptions -=r
  set guioptions -=L
endif

" Create temporary files in a temp dir
let g:tmpdir = $HOME . '/.vimtmp'
if !isdirectory(g:tmpdir)
  call mkdir(g:tmpdir, 'p')
endif
let &backupdir = g:tmpdir . '//,.'
let &directory = g:tmpdir . '//,.'

" JSX
let g:jsx_ext_required = 0

" Airline
let g:airline_powerline_fonts = 1

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1

" Hack
function HhFormat()
  let formatted = system('hh_format', join(getline(1, '$'), "\n"))
  if !empty(formatted) && !v:shell_error
    let c_pos = getpos('.')
    %delete
    put =formatted
    1d
    call setpos('.', c_pos)
  endif
endfunction
au BufWritePre *.php call HhFormat()

" Gutentags
set statusline+=%{gutentags#statusline()}
let g:gutentags_cache_dir = g:tmpdir

" ack.vim
let g:ackprg = 'rg --vimgrep'

" Go
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

" Neomake
autocmd! BufWritePost * Neomake

" Racer
let g:racer_experimental_completer = 1

if has('nvim')
  " Deoplete
  let g:deoplete#enable_at_startup = 1
else
  " Neocomplete
  let g:neocomplete#enable_at_startup = 1
endif
