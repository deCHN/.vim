.vim
====
My vim setup and plugin(s).

Install
=======
cd ~<br/>
git clone https://github.com/xnceth/.vim.git ~/.vim<br/>
ln -s ~/.vim/.vimrc ~/.vimrc<br/>
cd ~/.vim<br/>
<br/>
git submodule update --init --recursive<br/>

Suitable vim version
====================
VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Feb 19 2014 10:23:40)

Options
=======
1. YouCompleteMe - C/C++ semantic completion
- In order to enable semantic completion in "YouCompleteMe" for C/C++, you need to install clang/llvm separatly.
[https://github.com/Valloric/YouCompleteMe#full-installation-guide]

- It could cause problems by having USE="debug" on when emerging the clang/llvm package on Gentoo. Also take care about the min-versions YCM requires.
- After compiling with clang support, you need the "project configuration" file <i>.ycm_extra_conf.py</i> to pass the flags to clang compiler.
[https://github.com/Valloric/YouCompleteMe#c-family-semantic-completion-engine-usage]

2. YouCompleteMe - Java semantic completion
- Install Eclim for Java completion.
- Add <code>let g:EclimCompletionMethod = 'omnifunc'</code> in .vimrc.
