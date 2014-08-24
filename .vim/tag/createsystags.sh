#!/bin/bash - 
#===============================================================================
#
#          FILE: createsystags.sh
# 
#         USAGE: ./createsystags.sh 
# 
#   DESCRIPTION: create systags for vim ctags and taglist usage
#                systags with directory /usr/include/ /usr/local/include/ 
#       OPTIONS: ---
#  REQUIREMENTS: ctags
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: chenxilin
#  ORGANIZATION: chenxilinsidney@gmail.com
#       CREATED: 2014年05月20日 10时20分54秒 CST
#      REVISION: version 1.0 
#===============================================================================

set -o nounset                              # Treat unset variables as an error
if [ -d ${HOME}/.vim ]; then
    ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q -R -f ~/.vim/systags /usr/include /usr/local/include
fi



