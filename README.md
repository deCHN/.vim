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
git submodule foreach --recursive update --init<br/>

Suitable vim version
====================
VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Feb 19 2014 10:23:40)

Options
=======
1. YouCompleteMe for C/C++ semantic completion
- In order to enable semantic completion in "YouCompleteMe" for C/C++, you need to install clang/llvm separatly.
[https://github.com/Valloric/YouCompleteMe#full-installation-guide]

- It could cause problems by having USE="debug" on when emerging the clang/llvm package on Gentoo. Also take care about the min-versions YCM requires.
- After compiling with clang support, you need the "project configuration" file <i>.ycm_extra_conf.py</i> to pass the flags to clang compiler.
[https://github.com/Valloric/YouCompleteMe#c-family-semantic-completion-engine-usage]

YCM installation on Gentoo using system clang/llvm lib:
i. Make sure you have the submodule from YCM all initialized(thirdpart/ycmd, ...)
ii. mkdir ~/ycm_build && cd ~/ycm_build
iii. Assume the YCM installation path is ~/.vim/bundle/YouCompleteMe
iv. cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp 
v. make ycm_support_libs
vi. Config the .ycm_extra_conf.py in the right way and put it in the root folder of your clang project.

2. YouCompleteMe for Java semantic completion
- Install Eclim for Java completion.
- Add <code>let g:EclimCompletionMethod = 'omnifunc'</code> in .vimrc.
