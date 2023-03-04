fish_vi_key_bindings
set --global fish_greeting
set --global __fish_git_prompt_show_informative_status

set --global --export EDITOR $HOME/.local/bin/lvim
set --global --export VISUAL $HOME/.local/bin/lvim

source $HOME/.asdf/asdf.fish
source $HOME/.asdf/plugins/java/set-java-home.fish

if status is-interactive
  fzf_configure_bindings --directory=\cf # bind dir/file search to Ctrl+F

  alias rm="rm -iv"
  alias lg="lazygit"
  alias zola="flatpak run org.getzola.zola"
end

