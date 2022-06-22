syntax on


"=====[ Init Pathogen ]=====
execute pathogen#infect()


"=====[ Monokai Dark ]=====
let g:solarized_termcolors=256
" " set t_Co=256
colorscheme monokai
" " colorscheme uwu
highlight Pmenu ctermfg=lightgrey ctermbg=black
" 
" 
" "=====[ IDE Settings ]=====
let mapleader=","
 
set autoread                                                              
au FocusGained,BufEnter * :silent! !
 
" can be remove
set nobackup
set nowritebackup

set exrc " can put .vimrc inside project
set secure " security for exrc
set nocompatible
set cursorline
set lazyredraw
set showmatch
set clipboard=unnamed
set autoindent
set ttyfast
set smartindent
set number
" set relativenumber
set colorcolumn=90
set tabstop=4 "show existing tab with 4 spaces width
set shiftwidth=4 "when indenting with '>', use 4 spaces width
set expandtab "On pressing tab, insert 4 spaces
set foldmethod=indent
set nofoldenable "disable default folding
set updatetime=750

setlocal spell spelllang=fr
setlocal spell!
"toggle spell on or off
nnoremap <F7> :setlocal spell!<CR> 
 
let php_html_load=0
let php_html_in_heredoc=0
let php_html_in_nowdoc=0

let php_sql_query=0
let php_sql_heredoc=0
let php_sql_nowdoc=0

" remove include file on autocomplete (slow down)
setglobal complete-=i
 
" phprefactor
let g:vim_php_refactoring_make_setter_fluent = 1


"=====[ Persistant undo ]=====
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile


"=====[ YouCompleteMe ]=====
let g:ycm_key_list_select_completion = [] " This is to keep snipeMate snippets working with <TAB>
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
set completeopt-=preview


"=====[ Coc ]=====
let g:coc_global_extensions = ['coc-omnisharp', 'coc-psalm', 'coc-phpls']
nnoremap <silent><nowait> <Leader>c  :<C-u>CocList diagnostics<cr>
 

"=====[ VDebug ]=====
nmap <Leader>b :Breakpoint<CR>

" To function with docker, put this to .vimrc on project and map path local with
" docker container
if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif
let g:vdebug_options['path_maps'] = {'/var/www/api': '/var/www/html/coupdepouce-api'}


"=====[ SnipMate ]=====
let g:snipMate = { 'override' : 1 }


"=====[ Search ]=====
set path+=**
"auto highlight same word


"=====[ CtrlSf Search ]=====
let g:ctrlsf_default_view_mode = 'compact'

"=====[ Mouvment ]=====
nnoremap j gj
nnoremap k gk

"=====[ phpactor ]=====
nmap <Leader>tt :call phpactor#Transform()<CR>
nmap <Leader>cc :call phpactor#ClassNew()<CR>
nmap <Leader>o :call phpactor#GotoDefinition()<CR>
nmap <Leader>mf :call phpactor#MoveFile()<CR>
nmap <Leader>i :call phpactor#ImportMissingClasses()<CR>
nmap <Leader>cm :call phpactor#ContextMenu()<CR>
vmap <Leader>cp :call PhpExtractMethod()<CR>


"=====[ Smart search ]=====
set incsearch "Lookahead as search pattern is specified
set ignorecase "Ignore case in all searches...
set smartcase "unless uppercase letters used
set hlsearch "highlight all matches


"=====[ Active plugins ]=====
filetype plugin on


"=====[ GitGutter ]=====
let g:gitgutter_realtime = 0
let g:gitgutter_async = 0 " add this for conflict with namespace bundle


"=====[ Scroll performance ]=====
" set timeoutlen=30
" set timeoutlen=1000
" set ttimeout=0
 
 
"=====[ Remove highlight by taping esc two time ]=====
nnoremap <esc><esc> :nohl<cr>


"=====[ Set syntax for file type ]=====
au BufNewFile,BufFilePre,BufRead *.php set filetype=php
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.phtml set filetype=html
" au BufNewFile,BufFilePre,BufRead *.vue set filetype=js
au BufNewFile,BufNewFile,BufRead *.vue setlocal filetype=vue.html.javascript.css
au BufNewFile,BufFilePre,BufRead *.html.twig set filetype=twig.html
" when git commit, go to first line, search 'type' and visual it
au FileType gitcommit au! BufEnter COMMIT_EDITMSG execute ':execute "norm! gg/type\<cr>ve"'


"=====[ Php-cs-fixer ]=====
let g:php_cs_fixer_version = 3
let g:php_cs_fixer_verbose = 1
let g:php_cs_fixer_config_file = '.php-cs-fixer'
let g:php_cs_fixer_path = "~/.composer/vendor/friendsofphp/php-cs-fixer/php-cs-fixer"
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()


" "=====[ Indent ]=====
filetype plugin indent on


"=====[ Phpdoc ]=====
map <C-k> :call PhpDoc()<CR>
let g:pdv_cfg_ClassTags = []
let g:pdv_cfg_autoEndFunction = 0 "to remove end of function comment
let g:pdv_cfg_autoEndClass = 0 "to remove end of function comment
let g:pdv_cfg_php4always = 0 "to remove @access property 


"=====[ PhpUnit ]=====
map <Leader>t :!phpunit %<CR>


"=====[ Vim Namespace ]=====
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

let g:php_namespace_sort_after_insert = 1

"=====[ NERDTree Binds ]=====
map <C-n> :NERDTreeToggle<CR>
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"On vim load, toggle NERDTree and switch to file
augroup nerdtreeAuto
    autocmd!
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) | NERDTreeToggle | wincmd l | :q | endif
augroup END


"=====[ CtrlP Binds ]=====
map <C-b> :CtrlPBuffer<CR>
map <silent> <C-j> :CtrlPTag<cr><C-\>w


"=====[ Tagbar ]=====
nmap <C-l> :TagbarToggle<CR><C-w>l
" au BufReadPost,BufNewFile *.php TagbarOpen


"=====[ Ctag config (currently not working) ]=====
"function CreateTags()
"    :execute 'silent !ctags -R .' | redraw!
"endfunction
"nmap <silent> <Leader>t :call CreateTags()<CR>


"=====[ GUTENTAGS ]=====
let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*']


"=====[ Vim airline (always display not only on split) ]=====
set rtp+=/home/louis/.local/lib/python2.7/site-packages/powerline/bindings/vim/ "powerfont
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


"=====[ MultiCursor ]=====
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-c>'
let g:multi_cursor_quit_key='<Esc>'


"=====[ Syntesis ]=====
nmap <Leader>sd :let g:syntastic_php_checkers=[]<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_phpcs_args = '--standard=Symfony'
let g:syntastic_phpcs_disable = 0
let g:syntastic_phpmd_disable = 0
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_cs_checkers = ['code_checker']
" let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
" let g:syntastic_php_phpmd_post_args = 'ruleset.xml'
" let g:syntastic_debug = 1


"=====[ Correct mistypings ]=====
iab retrun return
iab functoin function
 

"=====[ Omnisharp dotnet ]=====
augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  " autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <C-]> <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>u <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <Leader>q :call vimspector#Reset()<CR>
