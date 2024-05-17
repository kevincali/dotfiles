fish_vi_key_bindings
set --global fish_cursor_insert line
set --global fish_cursor_visual block
set --global fish_cursor_replace_one underscore

set --global fish_greeting
set --global __fish_git_prompt_show_informative_status

if status is-interactive
    fzf_configure_bindings --directory=\cf # bind dir/file search to Ctrl+F

    alias rm="rm -iv"
    alias lg="lazygit"
    alias k="kubectl"
    alias ze="zellij --layout code"

    alias m="go build -ldflags='-linkmode external' cmd/service/main.go && MIRRORD_PROGRESS_MODE=off mirrord exec -f .mirrord/mirrord.yaml ./main"
    alias md="MIRRORD_PROGRESS_MODE=off mirrord exec -f .mirrord/mirrord.yaml dlv -- debug cmd/service/main.go"
end

atuin init fish --disable-up-arrow | source
zoxide init fish | source
