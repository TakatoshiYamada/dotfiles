if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U FZF_LEGACY_KEYBINDINGS 0

starship init fish | source

function attach_tmux_session_if_needed
    set ID (tmux list-sessions)
    if test -z "$ID"
        tmux new-session
        return
    end

    set new_session "Create New Session" 
    set ID (echo $ID\n$new_session | peco --on-cancel=error | cut -d: -f1)
    if test "$ID" = "$new_session"
        tmux new-session
    else if test -n "$ID"
        tmux attach-session -t "$ID"
    end
end

if test -z $TMUX 
    attach_tmux_session_if_needed
end
