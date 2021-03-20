
" Plugins {{{
	" Load vim plug manager if needed {{{{
		if empty(glob('~/.vim/autoload/plug.vim'))
		  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
		endif

	" }}}
	call plug#begin('~/.vim/plugged')
    Plug 'nanotech/jellybeans.vim'      " theme 
	Plug 'itchyny/lightline.vim'        " status bar
    Plug 'junegunn/goyo.vim'            "  
	Plug 'Yggdroot/indentLine'          " 
	Plug 'pangloss/vim-javascript'      " *.js
	Plug 'leafgarland/typescript-vim'   " *.ts
	Plug 'HerringtonDarkholme/yats.vim' " *.ts
    Plug 'rust-lang/rust.vim'           " *.rs syntax
    Plug 'racer-rust/vim-racer'         " *.rs code completion and navigation.
    Plug 'lilyball/vim-swift'           " *.swift
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " *.go
    Plug 'scrooloose/syntastic'         " lang support fallback
	call plug#end()
" }}}

" Visual {{{
	" Colors {{{
		syntax enable                    " enable syntax processing
		set t_Co=256                     " enable 256 colors
		set background=dark              " set dark theme
		set number relativenumber        " show line numbers
		let g:javascript_plugin_flow=1   " enable syntax for Flow
		let g:javascript_plugin_jsdoc=1  " enable syntax for @jsdoc
		
		if has('gui_running')            " setup font family:size
			set guifont =VictorMono-SemiBold:h13
		endif

		if (has("termguicolors"))        " enable true colors support
            set termguicolors
		endif

		colorscheme jellybeans 
	" }}}
	" Light Line {{{ 
		set laststatus=2  " Display Light line
		set noshowmode    " Hide default status bar

		let g:lightline = {
		      \ 'colorscheme': 'jellybeans',
		      \ 'active': {
		      \   'left': [ [ 'mode', 'paste' ],
		      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
		      \ },
		      \ 'component_function': {
		      \   'gitbranch': 'fugitive#head'
		      \ },
		      \ }
	" }}}
	" Folding {{{
		set foldmethod=marker " fold based on indent level
		set foldnestmax=10    " max 10 depth

		" toggle folding with space
		nnoremap <space> za
	" }}}
" }}}

" General {{{
	set nocompatible 
	set noswapfile
	" 1 tab == 4 spaces
	set tabstop=4 shiftwidth=4

	" use spaces instead of tabs
	set expandtab

	" always indent by multiple of shiftwidth
	set shiftround

	" indend/deindent at the beginning of a line
	set smarttab

    " enable mouse scroll and select
    set mouse=a
    
    " disable search highlight after done.  
    augroup vimrc-incsearch-highlight
        autocmd!
        autocmd CmdlineEnter [/\?] :set hlsearch
        autocmd CmdlineLeave [/\?] :set nohlsearch
    augroup END

	" ignore swapfile messages
	set shortmess+=A
	" no splash screen
	set shortmess+=I

	" draw less
	set lazyredraw
    
    " enable double quotes in JSON
    set conceallevel=0

    set autoindent
    filetype plugin indent on

    set backspace=indent,eol,start

    " set th width of directory explorer
    let g:netrw_winsize = 20
    " enable explorer preview by pressint "p"
    let g:netrw_preview = 1
    " open file from explorer in ver split
    let g:netrw_browse_split = 2

	" Mappings {{{
		" j + k = <esc>
		inoremap jk <esc>
		" Copy to OS clipboard
		vmap <leader>c "*y
		" Paste from OS clipboard
		map <leader>v "*p

        " Splits navigation
        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        nnoremap <C-H> <C-W><C-H>   

        " rust code jump 
        augroup Racer
            autocmd!
            autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
            autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
            autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
            autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
            autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
            autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
        augroup END
    " }}}
" }}}

