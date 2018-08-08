syntax on


"=====[ Init Pathogen ]=====
execute pathogen#infect()


"=====[ Monokai Dark ]=====
let g:solarized_termcolors=256
set t_Co=256
colorscheme monokai


"=====[ IDE Settings ]=====
let mapleader=","

set autoread                                                              
au FocusGained,BufEnter * :silent! !

set nocompatible
set cursorline
set lazyredraw
set showmatch
set clipboard=unnamed
set autoindent
set ttyfast
set smartindent
set number
"set relativenumber
set colorcolumn=90
set tabstop=4 "show existing tab with 4 spaces width
set shiftwidth=4 "when indenting with '>', use 4 spaces width
set expandtab "On pressing tab, insert 4 spaces
set foldmethod=indent
set nofoldenable "disable default folding
set updatetime=750


"=====[ Persistant undo ]=====
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile


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

"=====[ Smart search ]=====
set incsearch "Lookahead as search pattern is specified
set ignorecase "Ignore case in all searches...
set smartcase "unless uppercase letters used
set hlsearch "highlight all matches


"=====[ Active plugins ]=====
filetype plugin on


"=====[ Scroll performance ]=====
" set timeoutlen=30
" set timeoutlen=1000
" set ttimeout=0


"=====[ Remove highlight by taping esc two time ]=====
nnoremap <esc><esc> :nohl<cr>


"=====[ Set syntax for file type ]=====
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.phtml set filetype=html
au BufNewFile,BufFilePre,BufRead *.vue set filetype=js
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
"au BufNewFile,BufFilePre,BufRead *.html.twig   set filetype=html


"=====[ Indent ]=====
filetype plugin indent on


"=====[ Phpdoc ]=====
map <C-k> :call PhpDoc()<CR>
let g:pdv_cfg_ClassTags = []
let g:pdv_cfg_autoEndFunction = 0 "to remove end of function comment
let g:pdv_cfg_autoEndClass = 0 "to remove end of function comment
let g:pdv_cfg_php4always = 0 "to remove @access property 


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


"=====[ NERDTree Binds ]=====
map <C-n> :NERDTreeToggle<CR>
"On vim load, toggle NERDTree and switch to file
augroup vimrc
    autocmd!
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) | NERDTreeToggle | wincmd l | :q | endif
augroup END


"=====[ CtrlP Binds ]=====
map <C-b> :CtrlPBuffer<CR>
map <silent> <C-j> :CtrlPTag<cr><C-\>w


"=====[ Tagbar ]=====
"nmap <C-l> :TagbarToggle<CR><C-w>l
"au BufReadPost,BufNewFile *.php TagbarOpen


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
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_quit_key='<Esc>'


"=====[ Syntesis ]=====
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_phpcs_args = '--standard=Symfony'
let g:syntastic_phpcs_disable = 1
let g:syntastic_phpmd_disable = 1
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']


"=====[ Correct mistypings ]=====
iab retrun return
iab functoin function


"=====[ automatically reload vimrc on save ]=====
au BufWritePost .vimrc so ~/.vimrc
