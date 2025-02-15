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
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh";

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Dock Finder Safari SystemUIServer Terminal" killall;

# go
export GOPATH=$HOME/.go
export PATH="${PATH}:${GOPATH//://bin:}/bin"

# mise
eval "$(~/.local/bin/mise activate bash)"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# npm
eval "$(npm completion)"
