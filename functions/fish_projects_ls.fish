function fish_projects_ls -d "pretty list of projects"
  for p in (__fish_projects_list_short_names)
    echo $p (__fish_projects_name $p)
  end
end
