# for opencv
ctags -R --c++-kinds=+p -ICVAPI --fields=+iaS --extra=+q -f ~/.vim/tag/opencvtags ~/Dropbox/git/git_project/opencv/opencv/modules/
# for system header files
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/tag/systags  /usr/include/
# for system header files
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/tag/localsystags /usr/local/include/
# for c++ library and STL
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/tag/stdlibcpptags /usr/include/c++/4.8/
