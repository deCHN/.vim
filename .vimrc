filetype off
filetype plugin indent off

" Runtime - Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Runtime - Golang
" set runtimepath+=/cygdrive/c/Go/misc/vim/ 

set cursorline
set encoding=utf-8
set expandtab
set hlsearch
set ic
set incsearch
set laststatus=2
set nocompatible
set number
set ruler
set shiftwidth=3
set showcmd
set splitright
set tabstop=3
set listchars=tab:>-,eol:¬

" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" set completeopt=longest,menu

colorscheme xncSlate 

" Editor encoding
let &termencoding=&encoding

" Console encoding
language messages en_US.utf-8

" Easy <ESC>
"noremap <C-]> <ESC>

" The following command maps ',b' to display the buffer list and invoke the ':buffer' command. You can enter the desired buffer number and hit <Enter> to edit the buffer.
nnoremap ,b :ls<CR>:buffer<Space> " Easy scrolling
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
"inoremap <C-J> <DOWN>
"inoremap <C-K> <UP>

" Switch : and ;
nnoremap ; :
nnoremap : ;

" Clear last search highlighting
" http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
" nnoremap <Esc> :noh<CR><CR><Esc>


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

" Search for the keyword under the cursor in the current directory using the 'grep' command:
nnoremap <F8> :grep <C-R><C-W> *<CR>

" Inactivated key mapping.
" map! <F3> a<C-R>=strftime('%c')<CR><Esc>

" Trigger configuration. Not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsSnippetDirectories=["snip"]
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"
let g:UltiSnipsListSnippets="<C-L>"
"let g:UltiSnipsExpandTrigger="<C-CR>"
let g:UltiSnipsEditSplit="vertical"

let g:ycm_error_symbol="!"
let g:ycm_warning_symbol="?"
let g:ycm_key_invoke_completion="<F11>"
let g:ycm_key_list_select_completion=["<TAB>", "<DOWN>"]
let g:ycm_key_list_previous_completion=["<S-TAB>", "<UP>"]

autocmd Filetype java nnoremap <F3> :JavaSearchContext<CR><ESC>
autocmd Filetype c nnoremap <F2> :YcmDiags<CR><ESC>:q
autocmd Filetype c nnoremap <F3> :botright vs \| YcmCompleter GoToDefinition<CR><ESC><ESC>
autocmd Filetype c nnoremap <F4> :botright vs \| YcmCompleter GoToDeclaration<CR><ESC><ESC>
autocmd Filetype c nnoremap <F5> :botright vertical wincmd f<CR><ESC>
" Save the source code, compile it and run it.
autocmd Filetype c nnoremap <F6> :w<BAR>:!gcc % && ./a.out<CR>
" Check the memory leak of the programm 'a.out' under the current directory.
autocmd Filetype c nnoremap <F7> :w<BAR>:!valgrind --leak-check=full ./a.out<CR>

noremap <F10> :se noscb<CR>:vs \| e %<CR>jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjzz:se scb<CR><C-W><C-W>:se scb<CR>

" Identify the syntax highlighting group used at the cursor.
" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
nnoremap <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Enable the C reference within editor. Requires 'CRefVim' plugin.
autocmd BufNewFile, BufRead *.c helptags ~/.vim/bundle/CRefVim/doc

" Turn off the preview window after inserting.
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif 

filetype plugin indent on
syntax on
