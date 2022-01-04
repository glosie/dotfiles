switch (uname -s)
case Darwin
  set -Ux EDITOR "code --wait"
case *
  set -Ux EDITOR vim
end
