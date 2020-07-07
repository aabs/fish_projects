function __fish_projects_select -d "provides a selector for projects"
  set -U fish_projects_selected (__fish_projects_list_short_names | fzf)
end

