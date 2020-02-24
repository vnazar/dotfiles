" Check environment 
let g:is_linux = has('unix') && !has('macunix')
let g:is_mac = has('macunix')

let g:nvim_config_root = expand('<sfile>:p:h')

let g:config_file_list = [ 'variables.vim', 
    \ 'mappings.vim',
    \ 'plugins.vim',
    \ ]

for s:fname in g:config_file_list
    execute 'source ' . g:nvim_config_root . '/' . s:fname
endfor
