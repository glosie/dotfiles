# asdf
if functions --query asdf
    if test -f /opt/homebrew/opt/asdf/libexec/asdf.fish
        source /opt/homebrew/opt/asdf/libexec/asdf.fish
    else if $HOME/.asdf/asdf.fish
        source $HOME/.asdf/asdf.fish
    end
end