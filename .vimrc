" Basic vim settings
syntax on
set incsearch
set hlsearch
set showcmd
set smartindent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set nu
set rnu
set ruler

" Plugins
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
"Plug 'bfrg/vim-cpp-modern'
"Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" Set Plugins configurations
" Set airline theme
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#alt_sep = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_sep_alt = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_sep_alt = ' '
let g:airline_left_sep = ' '
let g:airline_left_sep_alt = ' '
let g:airline_right_sep = ' '
let g:airline_right_sep_alt = ' '

" Set colortheme
set background=dark
colorscheme onedark
"colorscheme gruvbox

" Set cpp syntax highlights
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1

" Set autopair & tab-autocomplete
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : Tabout()
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <c-n> coc#refresh()

"noremap [[ ?{<CR>w99[{
"noremap ][ /}<CR>b99]}
"noremap ]] j0[[%/{<CR>
"noremap [] k$][%?}<CR>

nnoremap i :silent! nohls<CR>i
function Tabout ()
    let dict = {')': 1, ']': 1, '}': 1, "'": 1, '"': 1, ';': 1}
    if has_key(dict, getline('.')[col('.')-1])
        return "\<Right>"
    else
        return "\<Tab>"
    endif
endfunction
