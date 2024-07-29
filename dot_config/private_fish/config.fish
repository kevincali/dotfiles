source /usr/share/cachyos-fish-config/cachyos-config.fish
source $XDG_CONFIG_HOME/fish/work.fish
set -gx XDG_CACHE_HOME "$HOME"/.cache
set -gx XDG_CONFIG_HOME "$HOME"/.config
set -gx XDG_DATA_HOME "$HOME"/.local/share
set -gx XDG_STATE_HOME "$HOME"/.local/state

set -gx XDG_CURRENT_DESKTOP Hyprland
set -gx XDG_SESSION_DESKTOP Hyprland
set -gx XDG_SESSION_TYPE wayland

set -gx GPG_TTY $(tty)

set -gx GOPATH "$XDG_DATA_HOME"/go
set -gx GOPRIVATE "github.com/kevincali/*,github.com/Clarilab/*,dev.azure.com"

set -gx PATH "$PATH:$HOME/.local/bin"
set -gx PATH "$PATH:$HOME/.cargo/bin"
set -gx PATH "$PATH:$HOME/.asdf/bin"
set -gx PATH "$PATH:$HOME/.asdf/shims"
set -gx PATH "$PATH:$GOPATH/bin"

if type -q hx
    set -gx EDITOR "$(which hx)"
end
if type -q helix
    set -gx EDITOR "$(which helix)"
end
set -gx VISUAL "$EDITOR"
set -gx TERMINAL "$(which alacritty)"

if status is-interactive
    # aliases
    alias e="zellij --layout code"
    alias hx="helix"
    alias lg="lazygit"
    alias rm="rm -iv"

    # custom bindings
    bind -M insert \ce forward-bigword
    bind -M insert \cb backward-bigword
    fzf_configure_bindings --directory=\cf --variables= # bind dir/file search to Ctrl+F

    # use vi bindings
    fish_vi_key_bindings
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block
    set fish_vi_force_cursor

    # remove greeting
    function fish_greeting
    end

    # options
    set fzf_fd_opts --hidden --no-ignore

    # sourcing
    atuin init fish --disable-up-arrow | source
    direnv hook fish | source
    zellij setup --generate-completion fish | source
    zoxide init fish | source
end
