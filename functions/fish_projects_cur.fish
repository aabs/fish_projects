function fish_projects_cur -d "display name of current project"
  colour_print bryellow "$fish_projects_current_sn: "; echo (__fish_projects_myyq "project.$fish_projects_current_sn.description")
end
