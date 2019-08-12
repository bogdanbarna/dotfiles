### ALIASES
alias a-v="aws-vault exec default -- aws"

### ENV VARs
export GOPATH="$HOME/go"
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR="vim"
export LOCAL_PATH="$HOME/.local/bin"
export GNU_SED="/usr/local/opt/gnu-sed/libexec/gnubin"
export PATH="$GNU_SED:$LOCAL_PATH:$PATH:$GOPATH/bin"

# Autocomplete
test -e aws_completer ; and source (which aws_completer)
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
test -e {$HOME}/.hub_shell_integration.fish ; and source {$HOME}/.hub_shell_integration.fish

# if command -v rbenv 1>/dev/null 2>&1; rbenv init - | source; end
if command -v pyenv 1>/dev/null 2>&1; pyenv init - | source; end

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.fish.inc" ]; . "$HOME/Downloads/google-cloud-sdk/path.fish.inc"; end

# GPG
export GPG_TTY=(tty)
