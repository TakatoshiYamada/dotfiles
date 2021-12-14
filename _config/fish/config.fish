## interactive
if status is-interactive
    # Commands to run in interactive sessions can go here
end

## fishの再読み込み用関数
function reload
  exec fish
end

## FZF key Bindings
set -U FZF_LEGACY_KEYBINDINGS 0

## Starship
starship init fish | source

## nodenv
eval (nodenv init - | source)

## cd後にls 
function cd 
    builtin cd $argv; and exa
end

## tmux
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
