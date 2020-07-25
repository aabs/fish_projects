function __fd2_p2_select -d "provides a selector for projects"
  set -l selection (__fd2_p2_list_short_names | fzf)
  __fd2_p2_set -s $selection
end

