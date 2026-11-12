# postgresql@18 is keg-only, so Homebrew does not link its binaries into bin.
if set -q HOMEBREW_PREFIX
    fish_add_path --global $HOMEBREW_PREFIX/opt/postgresql@18/bin
end
