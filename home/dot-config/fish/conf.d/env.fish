set -gx EDITOR nvim
if test (uname -s) = Darwin
  set -gx BUNDLER_EDITOR zed
end

# User-level binaries: mise, uv tools, and other installers.
fish_add_path --global $HOME/.local/bin
