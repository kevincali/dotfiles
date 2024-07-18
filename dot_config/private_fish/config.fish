source /usr/share/cachyos-fish-config/cachyos-config.fish
source $XDG_CONFIG_HOME/fish/work.fish

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
