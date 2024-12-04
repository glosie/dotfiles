# asdf
if test -f (brew --prefix asdf)/libexec/asdf.fish
    source (brew --prefix asdf)/libexec/asdf.fish
else if test -f $HOME/.asdf/asdf.fish
    source $HOME/.asdf/asdf.fish
end
