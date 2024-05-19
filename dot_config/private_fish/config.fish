source /usr/share/cachyos-fish-config/cachyos-config.fish

if status is-interactive
    alias hx="helix"
    alias k="kubectl"
    alias lg="lazygit"
    alias md="MIRRORD_PROGRESS_MODE=off mirrord exec -f .mirrord/mirrord.yaml dlv -- debug cmd/service/main.go"
    alias m="go build -ldflags='-linkmode external' cmd/service/main.go && MIRRORD_PROGRESS_MODE=off mirrord exec -f .mirrord/mirrord.yaml ./main"
    alias rm="rm -iv"
    alias ze="zellij --layout code"

    function fish_greeting
    end

    fish_vi_key_bindings
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block
    set fish_vi_force_cursor

    fzf_configure_bindings --directory=\cf --variables= # bind dir/file search to Ctrl+F
    set fzf_fd_opts --hidden --no-ignore

    atuin init fish --disable-up-arrow | source
    zoxide init fish | source
end
