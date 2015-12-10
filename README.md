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
" set background=dark
" colorscheme solarized
colorscheme monokai
set autoindent
set smartindent
set number
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
filetype plugin on
au BufRead,BufNewFile *.html.twig setfiletype=html
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_quit_key='<Esc>'
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
