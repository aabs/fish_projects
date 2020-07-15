function fish_projects_ls -d "pretty list of projects"
  for p in (__fish_projects_list_short_names)
    colour_print bryellow "$p"; echo -e "\t\t"(fish_projects_name $p)
  end
end
