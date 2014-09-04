
" Pathogen
filetype off " Pathogen needs to run before plugin indent on
call pathogen#incubate()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
filetype plugin indent on

" Change the mapleader fro \ to ,
let mapleader=","



"NerdTree

map <leader>n :execute 'NERDTreeToggle ' . getcwd()<CR>
nmap <F3> :NERDTreeToggle<CR>
" Move around panes 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set mousefocus

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
set colorcolumn=110
highlight ColorColumn ctermbg=Gray

"Go
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)


au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)

"Colors

"Syntastic Only use jshint
let g:syntastic_javascript_checkers=['jshint']
" ~/.vimrc
" " Make Vim recognize XTerm escape sequences for Page and Arrow
" " keys combined with modifiers such as Shift, Control, and Alt.
" " See http://www.reddit.com/r/vim/comments/1a29vk/_/c8tze8p
"
if &term =~ '256color'
  set t_ut=
endif

"C++ Completion
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

"Tags
set tags=./tags;tags;

"Go tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Airline
let g:airline_theme='bubblegum'
let g:airline#extensions#whitespace#checks=[]
let g:airline#extensions#tagbar#enabled = 1
set laststatus=2


" YCM
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" *** Tagbar
nmap <F8> :TagbarToggle<CR>
hi TagbarHighlight term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
