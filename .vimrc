" alex moiseenko config

" Plugins {{{
	" Load vim plug manager if needed {{{{
		if empty(glob('~/.vim/autoload/plug.vim'))
		  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
		endif

	" }}}
	call plug#begin('~/.vim/plugged')
	Plug 'arcticicestudio/nord-vim'     " scheme
	Plug 'chrisbra/Colorizer'           " color preview
	Plug 'chriskempson/base16-vim'      " synax
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
	syntax enable                    " enable syntax processing
	set t_Co=256                     " enable 256 colors
	set background=dark              " set dark theme
	set number relativenumber        " show line numbers
	let g:javascript_plugin_flow=1   " enable syntax for Flow
	let g:javascript_plugin_jsdoc=1  " enable syntax for @jsdoc
	
	if has('termguicolors')          " enable true colors support
	  set termguicolors
	endif

	if has('gui_running')            " setup font family:size
		set guifont =VictorMono-SemiBold:h13
	endif

	colorscheme nord 

	" Trasparent backgourd
	" hi! Normal ctermbg=NONE guibg=NONE
	" hi! NonText ctermbg=NONE guibg=NONE

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

