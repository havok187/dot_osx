#!/usr/bin/env bash

# set 256 color profile where possible
if [[ $COLORTERM == gnome-* && $TERM == xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp screen-256color >/dev/null 2>&1; then
    export TERM=screen-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

# Add tab completion for many Bash commands
if which brew &>/dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d"
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi

# ssh key chain
eval "$(ssh-add -K ~/.ssh/id_rsa &>/dev/null)"

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

#enable vi mode in bash
set -o vi

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Load the shell dotfiles, and then some:
load_dotfiles() {
	declare -a files=(
		$HOME/shell/theming # Custom bash prompt and colorful commands
		$HOME/shell/aliases # Aliases
		$HOME/shell/func    # Functions
		$HOME/shell/local   # Local and private settings not under version control
	)

	# if these files are readable, source them
	for index in ${!files[*]}; do
		if [[ -r ${files[$index]} ]]; then
			source ${files[$index]}
		fi
	done
}

load_dotfiles
unset load_dotfiles

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Exports

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Add sourcekit-LSP to the path
export PATH="$PATH:$HOME/.swift/sourcekit-lsp/.build/debug/sourcekit-lsp"

# add go worspace paths
export GOPATH="$HOME/Documents/golang"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"
export PATH="$PATH:/usr/local/smlnj/bin"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
# Rust infra bins 
export PATH="$HOME/.cargo/bin:$PATH"
# python
python3.7 -m site &> /dev/null && PATH="$PATH:`python3.7 -m site --user-base`/bin"
python2.7 -m site &> /dev/null && PATH="$PATH:`python2.7 -m site --user-base`/bin"
# vim setup 
export VISUAL=nvim
export EDITOR=nvim

# tab multiplexer configuration: https://github.com/austinjones/tab-rs/
source "/Users/alexmoiseenko/Library/Application Support/tab/completion/tab.bash"
# end tab configuration

