function fish_projects_cur -d "display name of current project"
  __fish_projects_myyq r "projects.$fish_projects_current_sn.description"
end
