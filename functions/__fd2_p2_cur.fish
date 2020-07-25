function __fd2_p2_cur -d "display name of current project"
  set -l p (__fd2_p2_sql_retrieve_project -s $__fd2_p2_current_sn)
  set -l title (__fd2_p2_get_project_field -f title -r $p)
__fd2_colour_print bryellow "$__fd2_p2_current_sn: "; echo $title
end
