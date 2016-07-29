syntax on
 

"=====[ Monokai Dark ]=====
let g:solarized_termcolors=256
set t_Co=256
colorscheme monokai


"=====[ IDE Settings ]=====
set clipboard=unnamed
set autoindent
set smartindent
set number
set relativenumber
set colorcolumn=90
set tabstop=4 "show existing tab with 4 spaces width
set shiftwidth=4 "when indenting with '>', use 4 spaces width
set expandtab "On pressing tab, insert 4 spaces


"=====[ Smart search ]=====
set incsearch "Lookahead as search pattern is specified
set ignorecase "Ignore case in all searches...
set smartcase "unless uppercase letters used
set hlsearch "highlight all matches


"=====[ Active plugins ]=====
filetype plugin on


"=====[ Scroll performance ]=====
set timeoutlen=1000
set ttimeoutlen=0


"=====[ Escape disable multiselectCursor ]=====
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>


"=====[ Set syntax for file type ]=====
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufRead,BufNewFile *.html.twig setfiletype=html


"=====[ Init Pathogen ]=====
execute pathogen#infect()


"=====[ Indent ]=====
filetype plugin indent on


"=====[ NERDTree Binds ]=====
map <C-n> :NERDTreeToggle<CR>


"=====[ CtrlP Binds ]=====
map <C-b> :CtrlPBuffer<CR>


"=====[ Tagbar Binds ]=====
nmap <C-l> :TagbarToggle<CR>


"=====[ Ctag config (currently not working) ]=====
"function CreateTags()
"    let curNodePath = g:NERDTreeFileNode.GetSelected().path.str()
"    exec ':!ctags -R --languages=php -f ' . curNodePath . '/tags ' . curNodePath
"endfunction
"nmap <silent> <F8> :call CreateTags()<CR>


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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_wq = 0


"=====[ Correct mistypings ]=====
iab retrun return
iab functoin function


"=====[ automatically reload vimrc on save ]=====
au BufWritePost .vimrc so ~/.vimrc


"=====[ On vim load, toggle NERDTree and switch to file ]=====
augroup vimrc
    autocmd!
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) | NERDTreeToggle | wincmd l | endif
augroup END
