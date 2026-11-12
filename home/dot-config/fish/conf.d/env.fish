set -gx EDITOR nvim
if test (uname -s) = Darwin
  set -gx BUNDLER_EDITOR zed
end

fish_add_path /opt/homebrew/opt/postgresql@16/bin
