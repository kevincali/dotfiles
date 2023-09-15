fish_vi_key_bindings
set --global fish_greeting
set --global __fish_git_prompt_show_informative_status

if status is-interactive
  fzf_configure_bindings --directory=\cf # bind dir/file search to Ctrl+F

  alias rm="rm -iv"
  alias lg="lazygit"
end

