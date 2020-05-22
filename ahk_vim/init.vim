let mapleader=" "

call plug#begin('~/.vim/plugged')
Plug 'asvetliakov/vim-easymotion'
"Plug 'easymotion/vim-easymotion'
call plug#end()


function! s:showCommandsV()
    call VSCodeNotify('peacock.changeColorToPeacockRed') 
    normal! v
    normal! h 
endfunction

function! s:showCommandsVexit()
    call VSCodeNotify('peacock.changeColorToPeacockBlue') 
endfunction

function! s:showCommandsMetaV()
    call VSCodeNotify('peacock.changeColorToPeacockvLight') 
    call feedkeys('v','n')
    call VSCodeCall('metaGo.gotoSmart') 
endfunction

function! s:showCommandsMetaI()
    call VSCodeNotify('peacock.changeColorToPeacockiLight') 
    call VSCodeCall('metaGo.gotoSmart') 
endfunction

function! s:showCommandsInsert()
    call VSCodeNotify('peacock.changeColorToPeacockGreen') 
    call feedkeys('i', 'n')
endfunction


nnoremap <silent> v :<C-u>call <SID>showCommandsV()<CR>
nnoremap <silent> i :<C-u>call <SID>showCommandsInsert()<CR>
vnoremap <silent> v :<C-u>call <SID>showCommandsVexit()<CR>
vnoremap <silent> <Esc> :<C-u>call <SID>showCommandsVexit()<CR>


vnoremap <silent> <Leader>g :<C-u>call <SID>showCommandsMetaV()<CR>
nnoremap <silent> <Leader>g :<C-u>call <SID>showCommandsMetaI()<CR>
nnoremap <silent> <Leader>s :<C-u>call VSCodeNotify('workbench.action.files.save')<CR> 


"map <Leader>g <Leader><Leader>s
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