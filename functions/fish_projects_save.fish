function fish_project_save -d "commits any changes in current porject home dir to git"
  fish_projects_home
  fdg save "wip"
end
