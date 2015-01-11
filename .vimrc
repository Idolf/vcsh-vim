set nocompatible

" Set a status line
set laststatus=2
" highlight User1 ctermbg=green guibg=green ctermfg=black guifg=black
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Show matches for () [] {} 
set showmatch

" Mixed auto-indentation
filetype plugin indent on
syn on
set autoindent
set smartindent

" Automatically flush to disk when using :make, etc.
set autowrite

" Automatically read in external changes if we haven't modified the buffer
set autoread

" Everything needs to be unicode. EVERYTHING
set encoding=utf8

" Makes arrow keys wrap lines in insert and replace mode
set whichwrap=[,]

" Enable folding
set foldenable
set foldmethod=marker

" Backspace can delete indentation, line breaks and the start of the insertion
set backspace=indent,eol,start

" Look for a tags file
set tags=./tags,./../tags,./../../tags,./../../../tags,tags

" F12 yanks to system clipboard
" Insert pastes from it
nnoremap <F12> :%y +<CR>
vnoremap <F12> "+y
nnoremap <Insert> o<Esc>"+p
inoremap <Insert> ☃<Esc>x"+pa

" Re-detect filetype
noremap <F5> :filetype detect<CR>

" Sets the tab-width
fun! TabWidth(size)
    set expandtab
    execute "set shiftwidth=" . a:size
    execute "set tabstop=" . a:size
    execute "set softtabstop=" . a:size
endfun

fun! Hex()
    execute "%!xxd"
    nnoremap <F8> :call<Space>UnHex()<CR>
endfun

fun! UnHex()
    execute "%!xxd -r"
    nnoremap <F8> :call<Space>Hex()<CR>
endfun

nnoremap <F8> :call<Space>Hex()<CR>

" Ident by 4 as a default
call TabWidth(4)

" Except in the following file types
autocmd FileType haskell,html,xhtml,php,xml,xslt,sh call TabWidth(2)
autocmd FileType haskell set softtabstop=0
