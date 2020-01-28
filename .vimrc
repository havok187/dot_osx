
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
	Plug 'arcticicestudio/nord-vim'     " theme
	Plug 'chriskempson/base16-vim'      " themes 
	Plug 'chrisbra/Colorizer'           " color preview
	Plug 'itchyny/lightline.vim'        " status bar
	Plug 'pangloss/vim-javascript'      " *.js
	Plug 'leafgarland/typescript-vim'   " *.ts
	Plug 'HerringtonDarkholme/yats.vim' " *.ts
	Plug 'mxw/vim-jsx'                  " *.jsx react compoents
	Plug 'JulesWang/css.vim'            " *.css
	Plug 'maksimr/vim-yate'             " *.yate
	Plug 'chase/vim-ansible-yaml'     
	Plug 'Yggdroot/indentLine'
	Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
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

		colorscheme nord 

	" }}}
	" Light Line {{{ 
		set laststatus=2  " Display Light line
		set noshowmode    " Hide default status bar

		let g:lightline = {
		      \ 'colorscheme': 'nord',
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
	" Mappings {{{
		" j + k = <esc>
		inoremap jk <esc>
		" Copy to OS clipboard
		vmap <leader>c "*y
		" Paste from OS clipboard
		map <leader>v "*p
	" }}}
" }}}

