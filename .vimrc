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
set listchars=tab:>-,eol:¬

colorscheme xncSlate 

" Editor encoding
let &termencoding=&encoding

" Console encoding
language messages en_US.utf-8

" Easy <ESC>
inoremap ;; <ESC>

" Easy scrolling
nnoremap j jzz
nnoremap k kzz

" Automatically append closing characters
" [http://vim.wikia.com/wiki/Automatically_append_closing_characters]
inoremap {{     {}<Left>
inoremap {<CR>  {<CR>}<Esc>O<Tab>
inoremap ((     ()<Left>
inoremap [[     []<left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" Switch : and ;
nnoremap ; :
nnoremap : ;

" Echo info about the current or supplied project.
" set statusline=%<%f\ %M\ %h%r%=%-10.(%l,%c%V\ %{eclim#project#util#ProjectStatusLine()}%)\ %P

" ECLIM {
" set runtimepath+=/cygdrive/c/Vim/vimfiles
" Disable Eclim with Taglist. [https://groups.google.com/forum/?fromgroups#!topic/eclim-user/GHy9_DsQA3s] 
" let g:taglisttoo_disabled = 1
" let g:EclimTaglistEnabled = 0
" let g:EclimDisable = 1
" Disable eclim logging plugin.
" let g:EclimLoggingDisabled = 1
" let g:EclimProjectStatusLine = 'p=${name}, n=${natures}'
" Use semantic completers from Eclim for YouCompleteMe
" let g:EclimCompletionMethod = 'omnifunc'
" } ECLIM

" Trigger configuration. Not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsSnippetDirectories=["snip"]
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsEditSplit="vertical"

" Mapping F3 for eclim JavaSearchContext command
autocmd Filetype java nnoremap <F3> :JavaSearchContext<CR><ESC>
autocmd Filetype c nnoremap <F3> :YcmCompleter GoToDefinition<CR><ESC>
autocmd Filetype c nnoremap <F4> :YcmCompleter GoToDeclaration<CR><ESC>

" Enable the C reference within editor. Requires 'CRefVim' plugin.
autocmd BufNewFile, BufRead *.c helptags ~/.vim/bundle/CRefVim/doc

" Identify the syntax highlighting group used at the cursor.
" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

filetype plugin indent on
syntax on
