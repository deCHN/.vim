filetype off
filetype plugin indent off

" Runtime - Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Runtime - Golang
set runtimepath+=/cygdrive/c/Go/misc/vim/ 

set cursorline
set encoding=utf-8
set expandtab
set hlsearch
set ic
set incsearch
set laststatus=2
set nocompatible
set ruler
set shiftwidth=3
set showcmd
set tabstop=3
"set t_Co=256

colorscheme xncSlate 

" Editor encoding
let &termencoding=&encoding

" Console encoding
language messages en_US.utf-8

" Editor font when running GUI
"if has('gui_running')
  "set guifont=Consolas:h9
"endif

" Easy scrolling
nmap <Space> <C-d>
nmap <S-Space> <C-u>
nnoremap j jzz
nnoremap k kzz

" Automatically append closing characters
" http://vim.wikia.com/wiki/Automatically_append_closing_characters
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O<Tab>
inoremap {{     {
inoremap {}     {}
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

" Switch : and ;
nnoremap ; :
nnoremap : ;


" ECLIM
set runtimepath+=/cygdrive/c/Vim/vimfiles

" Disable eclim logging plugin.
let g:EclimLoggingDisabled = 1

" Mapping F3 for eclim JavaSearchContext command
autocmd Filetype java nnoremap <F3> :JavaSearchContext<CR><ESC>   

" Echo info about the current or supplied project.
set statusline=%<%f\ %M\ %h%r%=%-10.(%l,%c%V\ %{eclim#project#util#ProjectStatusLine()}%)\ %P
let g:EclimProjectStatusLine = 'p=${name}, n=${natures}'

" Use semantic completers from Eclim for YouCompleteMe
let g:EclimCompletionMethod = 'omnifunc'

" Mapptin CTRL-D/U with ALT-D/U
" NOT WORKING: Issue of mapping ALT key under non-8bit terminal
" http://vim.wikia.com/wiki/Get_Alt_key_to_work_in_terminal
" set <m-d>=^[d
" set <m-u>=^[u
" nnoremap <m-d> <C-d>
" nnoremap <m-u> <C-u>
" set <m-a>=^[a
" map <m-a> ggVG

" Enable the C reference within editor. Requires 'CRefVim' plugin.
autocmd BufNewFile, BufRead *.c helptags ~/.vim/bundle/CRefVim/doc

" Trigger configuration. Not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsSnippetDirectories=["snip"]
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsEditSplit="vertical"

filetype plugin indent on
syntax on
