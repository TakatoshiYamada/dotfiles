if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U FZF_LEGACY_KEYBINDINGS 0

starship init fish | source

