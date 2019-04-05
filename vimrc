set nocompatible
"set pythondll="/usr/lib/x86_64-linux-gnu/libpython2.7.so"

"set pythonthreedll="/usr/lib/x86_64-linux-gnu/libpython3.5m.so"

" Pathogen
filetype off " Pathogen needs to run before plugin indent on
call pathogen#incubate()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
filetype plugin indent on

" Change the mapleader fro \ to ,
let mapleader=","


set title

"NerdTree

map <leader>n :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>f :execute 'NERDTreeFind'<CR>
nmap <F3> :NERDTreeToggle<CR>
set mousefocus
set mouse=a

set ff=unix
set ignorecase

" Tabs
set tabstop=2
set shiftwidth=2
set autoindent
set number
set showmatch
set smartcase
set expandtab

" spell
setlocal spell spelllang=en_us


" Color Schema

syntax enable

let g:kolor_italic=1                    " Enable italic. Default: 1
let g:kolor_bold=1                      " Enable bold. Default: 1
let g:kolor_underlined=0                " Enable underline for 'Underlined'. Default: 0
let g:kolor_alternative_matchparen=1    " Gray 'MatchParen' color. Default: 0

set term=xterm-256color
colorscheme kolor

" Omni Completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt+=longest

" Over ride 
set hidden " Don't let me close buffers
cmap w!! w !sudo tee % >/dev/null

" 110 vertical bar
set colorcolumn=120
highlight ColorColumn ctermbg=Gray

" Colors

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

if &term =~ '256color'
  set t_ut=
endif

"Tags
set tags=./tags,./../tags,./../../tags,./../../../tags,tags

" Airline
let g:airline_theme='bubblegum'
let g:airline#extensions#whitespace#checks=[]
let g:airline#extensions#tagbar#enabled = 1
set laststatus=2

" *** Tagbar
nmap <F8> :TagbarToggle<CR>
hi TagbarHighlight term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"persistant local vim
let g:localvimrc_persistent = 2

"ctrlp stuff
"let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Move around panes 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

function! PropagatePasteBufferToOSX()
  let @n=getreg('"')
  call system('pbcopy-remote', @n)
  echo "done"
endfunction

function! PopulatePasteBufferFromOSX()
  let @" = system('pbpaste-remote')
  echo "done"
endfunction

nnoremap <leader>6 :call PopulatePasteBufferFromOSX()<cr>
nnoremap <leader>7 :call PropagatePasteBufferToOSX()<cr>


function! Respace(var1, var2)
  let fromSpace=a:var1
  let toSpace=a:var2
  exec ':set ts=' . fromSpace . ' sts=' . fromSpace .' noet'
  retab!
  exec ':set ts=' . toSpace  . ' sts=' . toSpace .' et'
  retab
endfunction

