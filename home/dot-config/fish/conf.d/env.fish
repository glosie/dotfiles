switch (uname -s)
case Darwin
  set -Ux EDITOR nvim
  set -Ux BUNDLER_EDITOR zed
case *
  set -Ux EDITOR nvim
end

fish_add_path /opt/homebrew/opt/postgresql@16/bin
