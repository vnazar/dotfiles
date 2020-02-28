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
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

function! BuildCoc(info)
    call :CocInstall coc-tsserver
    call :CocInstall coc-python
    call :CocInstall coc-json
    call :CocInstall coc-phpls
    call :CocInstall coc-prettier
    call :CocInstall coc-eslint
endfunction
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release', 'do': function('BuildCoc') }


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


augroup fzf_settings
    let g:fzf_nvim_statusline = 0 " disable statusline overwriting
    
    nnoremap <silent> <leader><space> :Files<CR>
    nnoremap <silent> <leader>a :Buffers<CR>
    nnoremap <silent> <leader>A :Windows<CR>
    nnoremap <silent> <leader>; :BLines<CR>
    nnoremap <silent> <leader>o :BTags<CR>
    nnoremap <silent> <leader>O :Tags<CR>
    nnoremap <silent> <leader>? :History<CR>
    nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
    nnoremap <silent> <leader>. :AgIn 
    
    nnoremap <silent> K :call SearchWordWithAg()<CR>
    vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
    nnoremap <silent> <leader>gl :Commits<CR>
    nnoremap <silent> <leader>ga :BCommits<CR>
    nnoremap <silent> <leader>ft :Filetypes<CR>
    
    imap <C-x><C-f> <plug>(fzf-complete-file-ag)
    imap <C-x><C-l> <plug>(fzf-complete-line)
    
    function! SearchWordWithAg()
      execute 'Ag' expand('<cword>')
    endfunction
    
    function! SearchVisualSelectionWithAg() range
        let old_reg = getreg('"')
        let old_regtype = getregtype('"')
        let old_clipboard = &clipboard
        set clipboard&
        normal! ""gvy
        let selection = getreg('"')
        call setreg('"', old_reg, old_regtype)
        let &clipboard = old_clipboard
        execute 'Ag' selection
    endfunction
    
    function! SearchWithAgInDirectory(...)
      call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
    endfunction
    command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
augroup end

