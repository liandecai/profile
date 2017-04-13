set backspace=indent,eol,start
set nocp
set encoding=utf-8
set fileencoding=utf-8

syntax enable
syntax on
" solarized setting 
colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif
" end solarized setting 
set tabstop=4   "tab键长度为4
set softtabstop=4
set shiftwidth=4
set expandtab  " tab 展开用空格代替
set autoindent "自动缩进
set cindent    "采用c语言缩进
set nu         "显示行号
set clipboard+=unnamed

" vundle setting

set nocompatible              " be iMproved  
filetype off                  " required!  
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Bundle 'git://github.com/Lokaltog/vim-powerline'

Bundle 'majutsushi/tagbar'

Plugin 'scrooloose/nerdtree'
" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "

call vundle#end()            " required
filetype plugin indent on    " required

"end vundle setting

"powerline 
set guifont=PowerlineSymbols\ for\ Powerline
set laststatus=2 " if not the statusline is hidden/only appears in split windows!
set t_Co=256
let g:Powerline_symbols = 'fancy'
"end powerline setting
"

" tarbar setting 
" nmap <Leader>tb :TagbarToggle<CR>
" let g:tagbar_left = 1
let g:tagbar_show_linenumbers = -1

" see :help autocmd.txt
" see :help tarbar / tagbar-autoopen
autocmd BufReadPost *.java,*.cpp,*.c,*.py call tagbar#autoopen()

autocmd BufNewFile *.cpp 0r ~/.vim/tpl/cpp.tpl " c++模板
" end tarbar setting

" nerdtree setting 
"autocmd vimenter * NERDTree

" nerdtree setting end


function! CompileRunC()
    exec "w"
    exec "!g++ % -o %<"
    exec "! ./%<" 
endfunction


"map
let mapleader=","
map <F4> <Esc>gg<C-v>G$A,<Esc><Esc>:%j <CR> :%s/ //g <CR>" 在最后一行添加一个, 并合并所有行
map <F5> <Esc>:%!python -m json.tool <CR> " 格式化json数据 
map <F6> <Esc>:%!native2ascii -encoding UTF-8 -reverse <CR> "把unicode 转 utf-8
map <F7> :%!tidy -utf8 -xml -w 255 -i -c -q -asxml <CR> "格式化xml
map <Leader><F3> <Esc>:NERDTreeToggle <CR>
nmap <Leader>tb :TagbarToggle<CR>

nmap <Leader>q :q!<CR>
nmap <Leader>w :w<CR>
noremap <Leader>W :w !sudo tee % > /dev/null

nmap <Leader>p :set paste<CR>
nmap <Leader>np :set nopaste<CR>

nmap <Leader>nnu :set nonu<CR>
nmap <Leader>nu :set nu<CR>
nmap <Leader>b :set bomb<CR>
map <Leader>m :%s/^M//g<CR>

noremap <Leader>r :call CompileRunC()<CR>

" 宏使用方法
" 录制
" "ap 打印a寄存器的宏
