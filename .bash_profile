# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some
for file in ~/.{bash_prompt,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';
# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
fi;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# Make `python` point to Homebrew python3
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# go
export GOPATH=$HOME/.go
export PATH="${PATH}:${GOPATH//://bin:}/bin"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# virtualenv
if [ -r /usr/local/bin/virtualenvwrapper.sh ] && [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi
export WORKON_HOME=~/.virtualenvs
