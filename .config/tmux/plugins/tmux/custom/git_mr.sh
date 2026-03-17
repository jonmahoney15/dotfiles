show_git_mr() {
  local index icon color text module

  index=$1

  icon="$(  get_tmux_option "@catppuccin_git_mr_icon"  "󰇖" )"
  color="$( get_tmux_option "@catppuccin_git_mr_color" "$thm_blue" )"
  text="$(  get_tmux_option "@catppuccin_git_mr_text"  "#(~/.config/tmux/scripts/mr_count.sh)" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
