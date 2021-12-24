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
if test (which bass)    
    bass source ($HOME/Code/pco/bin/pco init - | psub)
end

if test -f $HOME/.pcorc
    source $HOME/.pcorc
end

# asdf
if test (which asdf)
    if test -f /opt/homebrew/opt/asdf/libexec/asdf.fish
        source /opt/homebrew/opt/asdf/libexec/asdf.fish
    else if $HOME/.asdf/asdf.fish
        source $HOME/.asdf/asdf.fish
    end
end

# git
set -gx GIT_DUET_CO_AUTHORED_BY 1
alias glo='git log --oneline --decorate'