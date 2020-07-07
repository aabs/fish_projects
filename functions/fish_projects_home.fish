function fish_projects_home -d "goto home dir of current project"
  fish_projects_cd $fish_projects_current_sn
  __fish_projects_switch_tmux_sessions  $fish_projects_current_sn
end
