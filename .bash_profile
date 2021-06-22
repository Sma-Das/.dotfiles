#!/usr/local/bin/bash

# Adding items to PATH

export PATH="$HOME/bin:$PATH";
export PATH="/usr/local/sbin:$PATH";
export PATH="/usr/local/bin:$PATH";
export PATH="/Users/smadas/opt/anaconda3/bin:$PATH"

# Add colour to terminal:
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Source complementary files for bash
for file in ~/bash_settings/.{path,bash_prompt,exports,aliases,functions,custom,complete}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
        # Ensure existing Homebrew v1 completions continue to work
        export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
        source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion;
fi;
# 40-46 eats the most time, unset for increased performance
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi
unset PREFIX

# No idea what this is
# printf "protocol=https\nhost=github.com\n" | git credential-osxkeychain erase

source ~/.bash_prompt
HISTCONTROL=ignoreboth;
command clear;
