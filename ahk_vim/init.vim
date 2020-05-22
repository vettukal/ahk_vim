let mapleader=" "

call plug#begin('~/.vim/plugged')
Plug 'asvetliakov/vim-easymotion'
"Plug 'easymotion/vim-easymotion'
call plug#end()

map <Leader>g <Leader><Leader>s
noremap <silent> <Leader>z u
vnoremap <silent> <Leader>z u
vnoremap <silent> <Leader>c "+y
nnoremap <silent> <Leader>c "+y

vnoremap <silent> <Leader>v "+p
nnoremap <silent> <Leader>v "+p

vnoremap <silent> <Leader>x "+x
nnoremap <silent> <Leader>x "+x

vnoremap <silent> <Leader>a vggvG$
nnoremap <silent> <Leader>a ggvG$ 

nnoremap <silent> <Leader>s :<C-u>call VSCodeNotify('workbench.action.files.save')<CR> 

nnoremap w k
nnoremap a h
nnoremap s j
nnoremap d l

nnoremap q 0
nnoremap e $

nnoremap l w
nnoremap hh dd

vnoremap w k
vnoremap a h
vnoremap s j
vnoremap d l

vnoremap q 0
vnoremap e $

vnoremap l w