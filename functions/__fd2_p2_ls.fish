function __fd2_p2_ls -d "pretty list of projects"
  for p in (__fd2_p2_list_short_names)
    fd2_colour_print bryellow "$p"; echo -e "\t\t"(__fd2_p2_name -s $p)
  end
end
