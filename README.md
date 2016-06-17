# Snippet

## stjerm

> stjerm -ah false -w 1920 -h 500 -p top -o 60 -k F1 &

> stjerm -ah false -w 900 -h 1050 -p left -o 60 -k F3 &

> stjerm -ah false -w 900 -h 1050 -p right -o 60 -k F4 &

## Sublim text 3

 * afterglow (theming)
 * predawn (color)

{
    "color_scheme": "Packages/Predawn/predawn.tmTheme",
    "default_encoding": "UTF-8",
    "ignored_packages":
    [
    "Vintage"
    ],
    "tab_size": 4,
    "tabs_small": true,
    "theme": "Afterglow.sublime-theme",
    "translate_tabs_to_spaces": true,
    "trim_tr
    ailing_white_space_on_save": true
}

## .vimrc

```
syntax on
" Solarized Dark
let g:solarized_termcolors=256
set t_Co=256
colorscheme monokai
set clipboard=unnamed
set autoindent
set smartindent
set number
set relativenumber
set colorcolumn=90
set hlsearch
set incsearch
set timeoutlen=1000
set ttimeoutlen=0
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
execute pathogen#infect()
filetype plugin indent on
map <C-n> :NERDTreeToggle<CR>
map <C-b> :CtrlPBuffer<CR>
function CreateTags()
    let curNodePath = g:NERDTreeFileNode.GetSelected().path.str()
    exec ':!ctags -R --languages=php -f ' . curNodePath . '/tags ' . curNodePath
endfunction
nmap <silent> <F8> :call CreateTags()<CR>
nmap <C-l> :TagbarToggle<CR>
filetype plugin on
au BufRead,BufNewFile *.html.twig setfiletype=html
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" Vim airline (always display not only on split)
set rtp+=/home/louis/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" air-line
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

" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_quit_key='<Esc>'

" Syntesis
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_wq = 0
```

## Vim plugins 

* Patogen
* Ctrl-P
* delimitmate
* nerdtree
* tlib_vim (dependencie)
* vim-addon-mw-utils (dependencie)
* vim-airline
* vim-gitgutter
* vim-multiple-cursor
* vim-snipmate
* vim-snippets
* vim-twig
* emmet
* syntastic (https://github.com/scrooloose/syntastic)
