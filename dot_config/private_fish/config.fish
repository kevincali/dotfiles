source /usr/share/cachyos-fish-config/cachyos-config.fish
source $XDG_CONFIG_HOME/fish/work.fish

if status is-interactive
    alias e="zellij --layout code"
    alias hx="helix"
    alias lg="lazygit"
    alias rm="rm -iv"

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
    zellij setup --generate-completion fish | source
    zoxide init fish | source
end
