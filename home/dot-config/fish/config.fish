if status is-interactive
    starship init fish | source

    # uv
    fish_add_path "$HOME/.local/bin"
end

set fish_greeting ""
# ~/.local/bin/mise activate fish | source
