function fish_projects_save -d "commits any changes in current porject home dir to git with msg from argv"
  fish_projects_cd $fish_projects_current_sn
  echo fdg save "$argv"
  fdg save "$argv"
  prevd
end
