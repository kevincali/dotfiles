fish_vi_key_bindings
set --global fish_greeting
set --global __fish_git_prompt_show_informative_status


source $HOME/.asdf/asdf.fish
source $HOME/.asdf/plugins/java/set-java-home.fish
set --global --export EDITOR $HOME/.linuxbrew/bin/hx
set --global --export VISUAL $HOME/.linuxbrew/bin/hx

if status is-interactive
  fzf_configure_bindings --directory=\cf # bind dir/file search to Ctrl+F

  alias rm="rm -iv"
  alias lg="lazygit"
  alias zola="flatpak run org.getzola.zola"
end

