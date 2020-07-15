function fish_projects_edit -d "goto home dir of project and start editor"
  fish_projects_cd $fish_projects_current_sn
  eval "$EDITOR ."
end
