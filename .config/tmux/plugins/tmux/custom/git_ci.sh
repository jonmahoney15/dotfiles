show_git_ci() {
  local index icon color text module

  index=$1

  icon="$(  get_tmux_option "@catppuccin_git_ci_icon"  "󰐄" )"
  color="$( get_tmux_option "@catppuccin_git_ci_color" "$thm_green" )"
  text="$(  get_tmux_option "@catppuccin_git_ci_text"  "#(~/.config/tmux/scripts/ci_status.sh)" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
