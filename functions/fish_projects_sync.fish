function fish_projects_sync -d "commits any changes in current porject home dir to git and push to origin etc"
  if functions -q fdg
  fish_projects_cd $fish_projects_current_sn
  fdg sync "$argv"
  end
end

