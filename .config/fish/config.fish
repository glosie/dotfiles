if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

starship init fish | source

# VOLTA
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# PCO
set -gx AWS_CLI_PATH (which aws)
bass source ($HOME/Code/pco/bin/pco init - | psub)
source $HOME/.pcorc

# asdf
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# git
set -gx GIT_DUET_CO_AUTHORED_BY 1
alias glo='git log --oneline --decorate'