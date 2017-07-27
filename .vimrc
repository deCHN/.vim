filetype off
filetype plugin indent off

" Runtime - Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

set cursorline
set encoding=utf-8
set expandtab
set tabstop=3
set shiftwidth=3
set foldcolumn=1
set foldclose=all
set foldmethod=indent
set hlsearch
set ic
set incsearch
set laststatus=2
set nocompatible
set number
set ruler
set showcmd
set splitright
set listchars=tab:>-,eol:¬
set autoread
" No nesting fold
set foldnestmax=1

" access system clipboard with this line
set clipboard=unnamed 
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" set completeopt=longest,menu

colorscheme allgood 

" Editor encoding
let &termencoding=&encoding

" Console encoding
language messages en_US.utf-8

" Enable folding with the spacebar
nnoremap <space> za

" Display the buffer list and invoke the ':buffer' command. Default switch back to the last('#') buffer.
nnoremap <Tab><Tab> :ls<CR>:b<Space>#

" Easy scrolling
" input <alt-j>: ctrl-v alt-j
nnoremap j j
nnoremap k k
"nnoremap j jzz
"nnoremap k kzz

" Add newline without entering insert mode
nnoremap <C-j> i<CR><Esc>

"nnoremap <C-J> jjjjjjjzz
"nnoremap <C-K> kkkkkkkzz

" Automatically append closing characters
" [http://vim.wikia.com/wiki/Automatically_append_closing_characters]
inoremap {<CR>  {<CR>}<Esc>O<Tab>
inoremap {{     {}<Left>
inoremap ((     ()<Left>
inoremap [[     []<left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

nnoremap <C-/>  \ci

" Switch : and ;
nnoremap ; :
nnoremap : ;

" Search for visually selected text
vnorem // y/<c-r>"<cr>

" UltiSnip
"
" Trigger configuration. Not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsSnippetDirectories=["xncSnips", "UltiSnips"]
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" Conflict with iomap <RIGHT>."
" let g:UltiSnipsExpandTrigger="<c-l>"
"let g:UltiSnipsListSnippets="<c-m>"
" let g:UltiSnipsEditSplit="vertical"

" YouCompleteMe
"
let g:ycm_key_invoke_completion = '.'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_add_preview_to_completeopt = 1 
let g:ycm_autoclose_preview_window_after_completion = 1

" Move the preview window to the right instead of top
" wincmd = <C-W><S-L>
autocmd WinEnter * if &previewwindow | wincmd L | endif


" Enable the C reference within editor. Requires 'CRefVim' plugin.
" autocmd BufNewFile, BufRead *.c helptags ~/.vim/bundle/CRefVim/doc

" Enable html templates highlighting
" au BufNewFile, BufRead *.htmpl se ft=html

" Turn off the preview window after inserting.
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif 

" let g:tagbar_left=1
" nnoremap <F10> :TagbarToggle<CR><C-w>h
"let g:tagbar_compact=1
" let g:tagbar_width=47

" autocmd Filetype java nnoremap <F3> :JavaSearchContext<CR><ESC>

" autocmd Filetype javascript nnoremap gd :TernDef<CR><ESC>

" let g:go_auto_type_info="1"
autocmd Filetype go nnoremap <F1> :GoInfo<CR>
autocmd Filetype go nnoremap <F2> :GoRename<CR>
autocmd Filetype go nnoremap <F3> :GoTestFunc<CR>
autocmd Filetype go nnoremap <F4> :!go test -cover<CR>
autocmd Filetype go nnoremap <F5> :GoRun %<CR>

" autocmd Filetype c nnoremap <F2> :YcmDiags<CR><ESC>:q
" autocmd Filetype c nnoremap <F2> :YcmDiags<CR><ESC>:q
" autocmd Filetype c nnoremap <F3> :botright vs \| YcmCompleter GoToDefinition<CR><ESC><ESC>
" autocmd Filetype c nnoremap <F4> :botright vs \| YcmCompleter GoToDeclaration<CR><ESC><ESC>
" autocmd Filetype c nnoremap <F5> :botright vertical wincmd f<CR><ESC>
" Save the source code, compile it and run it.
" autocmd Filetype c nnoremap <F6> :w<BAR>:!gcc -fdump-rtl-expand % -o vimF6.out -g -Wall -O0 && ./vimF6.out<CR>
" autocmd Filetype c nnoremap <F7> :!egypt %.150r.expand \| dot -Tsvg -o ~/Dropbox/egypt/%.svg<CR>
" Check the memory leak of the programm 'a.out' under the current directory.
" autocmd Filetype c nnoremap <F10> :w<BAR>:!valgrind --leak-check=full ./a.out<CR>
"autocmd Filetype c nnoremap <F9> :make deploy<CR>

"noremap <F10> :se noscb<CR>:vs \| e %<CR>jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjzz:se scb<CR><C-W><C-W>:se scb<CR>

" Identify the syntax highlighting group used at the cursor.
" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
nnoremap <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Enable the C reference within editor. Requires 'CRefVim' plugin.
" autocmd BufNewFile, BufRead *.c helptags ~/.vim/bundle/CRefVim/doc

" Enable html templates highlighting
" au BufNewFile, BufRead *.htmpl se ft=html

" Turn off the preview window after inserting.
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif 

" Enable spell check for text like files.
" Default is English. To change it to German: set spelllang=de
autocmd Filetype latex,tex,md,markdown,text setlocal spell

filetype plugin indent on
syntax on

" Python code formatting
" Need to run after ftplugin
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd BufWritePost *.py :!autopep8 -ai <afile>

" Clear the line for transparent terminal
"hi Normal ctermbg=NONE
"hi NonText ctermbg=NONE
