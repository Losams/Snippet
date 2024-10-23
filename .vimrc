syntax on

"=====[ Init Pathogen ]=====
execute pathogen#infect()

filetype plugin indent on

syntax enable
colorscheme monokai


" "=====[ IDE Settings ]=====
let mapleader=","

set visualbell
set t_vb=
set cursorline
set number
set smartindent
set tabstop=4 "show existing tab with 4 spaces width
set shiftwidth=4 "when indenting with '>', use 4 spaces width
set expandtab "On pressing tab, insert 4 spaces
set ignorecase "Ignore case on all search
set updatetime=500 "time to update screen 
set hlsearch "highlight all matches
set incsearch "Lookahead as search pattern during the search
set hidden "hide buffers instead of closing them
set scrolloff=3 "keep 3 lines around the cursor
set sidescrolloff=5 "keep 5 columns around the cursor

imap jk <Esc>

" disable expandtab for makefiles
autocmd FileType make setlocal noexpandtab

"=====[ Undo history ]=====
set history=1000
set undofile
set undodir=~/.vimundo/


"=====[ Codeium ]=====:call codeium#Chat
let g:codeium_disable_bindings = 1
imap <script><silent><nowait><expr> <C-l> codeium#Accept()
nmap <Leader>co :call codeium#Chat()<CR>


"=====[ Search ]=====
nnoremap <esc><esc> :nohl<cr>


nnoremap <F5> :UndotreeToggle<CR>

"=====[ Set syntax for file type ]=====
"au BufNewFile,BufRead *.php set filetype=php
au BufRead,BufNewFile *.php set ft=php


"=====[ SnipMate ]=====
let g:snipMate = { 'snippet_version' : 1 }


"=====[ php-namespace ]=====
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction

autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>


"=====[ Php-cs-fixer ]=====
let g:php_cs_fixer_version = 3
let g:php_cs_fixer_verbose = 1
let g:php_cs_fixer_config_file = 'website/.php-cs-fixer.php'
let g:php_cs_fixer_allow_risky = 'yes'
let g:php_cs_fixer_path = "~/.config/composer/vendor/friendsofphp/php-cs-fixer/php-cs-fixer"
"let g:php_cs_fixer_rules = '@Symfony'
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()


"=====[ git blame ]=====
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>


"=====[ vimdiff ]=====
nmap <Leader>gd :diffsplit<CR>



"=====[ Fzf ]=====
nnoremap <Leader>f :Ag<Space>
let g:fzf_layout = {}


"=====[ GitGutter]=====
"nmap <Leader>gd :GitGutterDiffOrig<CR>


"=====[ GUTENTAGS ]=====
let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml', '*.phar', '*.ini', '*.rst', '*.md', '*vendor/*/test*', '*vendor/*/Test*', '*vendor/*/fixture*', '*vendor/*/Fixture*', '*var/cache*', '*var/log*']


"=====[ NETRW ]=====
let g:netrw_liststyle=3


"=====[ CtrlP Binds ]=====
map <C-b> :CtrlPBuffer<CR>


"=====[ phpactor ]=====
nmap <Leader>pc :!~/.vim/bundle/phpactor/bin/phpactor index:build<CR>
nmap <Leader>tt :call phpactor#Transform()<CR>
nmap <Leader>o :call phpactor#GotoDefinition()<CR>
nmap <Leader>mf :call phpactor#MoveFile()<CR>
nmap <Leader>i :call phpactor#ImportMissingClasses()<CR>
nmap <Leader>mm :call phpactor#ContextMenu()<CR>
vmap <Leader>cp :PhpactorExtractMethod<CR>
nmap <Leader>u :call PhpactorImportMissingClasses()<CR>


"=====[ Coc ]=====
let g:coc_global_extensions = ['coc-psalm', 'coc-phpls', 'coc-rome', 'coc-tsserver']
nnoremap <silent><nowait> <Leader>d  :<C-u>CocList diagnostics<cr>


"=====[ NERDTree Binds ]=====
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGlyphReadOnly = "RO"
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"On vim load, toggle NERDTree and switch to file
augroup nerdtreeAuto
    autocmd!
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) | NERDTreeToggle | wincmd l | :q | endif
augroup END


"=====[ Auto apply vim setting on vimrc change ]=====
if has("autocmd")
    autocmd! bufwritepost .vimrc source ~/.vimrc
endif
