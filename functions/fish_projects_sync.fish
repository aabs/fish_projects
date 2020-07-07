function fish_project_sync -d "commits any changes in current porject home dir to git and push to origin etc"
  fish_projects_home
  fdg sync "wip"
end

