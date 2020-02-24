"""""""""""""""""""""""""""""""
" Auto install
"""""""""""""""""""""""""""""""
let g:VIM_PLUG_PATH = expand(g:nvim_config_root . '/autoload/plug.vim')
if executable('curl')
    if empty(glob(g:VIM_PLUG_PATH))
        echomsg 'Installing Vim-plug on your system'
        silent execute '!curl -fLo ' . g:VIM_PLUG_PATH . ' --create-dirs '
            \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

        augroup plug_init
            autocmd!
            autocmd VimEnter * PlugInstall --sync | quit |source $MYVIMRC
        augroup END
    endif
else
    echoerr 'You have to install curl to install vim-plug, or install '
            \ . 'vim-plug by yourself.'
    finish
endif

let g:PLUGIN_HOME=expand(stdpath('data') . '/plugged')

"""""""""""""""""""""""""""""""
" Plugins installs
"""""""""""""""""""""""""""""""
call plug#begin(g:PLUGIN_HOME)
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()


"""""""""""""""""""""""""""""""
" Plugins Config
"""""""""""""""""""""""""""""""
augroup nerdtree_settings	
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    nnoremap <Leader>t :NERDTreeToggle<Enter>
    nnoremap <silent> <Leader>v :NERDTreeFind<CR>
    let NERDTreeQuitOnOpen = 1
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
augroup end
