if test -e /usr/share/cachyos-fish-config/cachyos-config.fish
    source /usr/share/cachyos-fish-config/cachyos-config.fish
end
if test -e $XDG_CONFIG_HOME/fish/work.fish
    source $XDG_CONFIG_HOME/fish/work.fish
end

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
    if type -q helix
        alias hx="helix"
    end
    alias lg="lazygit"
    alias rm="rm -i --verbose"
    alias lr="eza --all --long --sort=modified --icons" # recently modified

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
    if type -q atuin
        atuin init fish --disable-up-arrow | source
    end
    if type -q direnv
        direnv hook fish | source
    end
    if type -q zellij
        zellij setup --generate-completion fish | source
    end
    if type -q zoxide
        zoxide init fish | source
    end
end
