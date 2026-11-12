set -gx EDITOR nvim
if test (uname -s) = Darwin
  set -gx BUNDLER_EDITOR zed
end
