function fish_projects_open -d "select from existing projects"
  __fish_projects_select 
  if set -q fish_projects_selected 
    __fish_projects_set $fish_projects_selected
    fish_projects_home
  end
end

