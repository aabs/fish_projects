function __fd2_p2_sql_update_project -d "update a project entry in the database, identified by project shortname which may not be changed"
    set -l id -1
    set -l title 'not set'
    set -l desc 'not set'
    set -l dbpath 'not set'
    set -l shortname ''
    set -l active -1
    set -l current -1

    getopts $argv | while read -l key value
        switch $key
            case t title
                set title $value
            case i id
                set id $value
            case d desc
                set desc $value
            case s shortname
                set shortname $value
            case p path
                set dbpath $value
            case a active
                set active $value
            case c current
                set current $value
        end
    end

    if test -z $shortname
      error "short name must be set (use the -s option)" >&2
      return 1
    end

# CREATE TABLE project(id varchar(4), title varchar(256), description varchar(1024), 
#    path varchar(1024), shortname varchar(16), active boolean, current boolean);
  set sep ""
  set upd_stmt "update project set "
  if test $title != "not set" -a $title != ''
      set upd_stmt "$upd_stmt $sep title='$title' "
      set sep ", "
  end
  if test $desc != "not set" -a $desc != ''
      set upd_stmt "$upd_stmt $sep description='$desc' "
      set sep ", "
  end
  if test $dbpath != "not set" -a $dbpath != ''
      set upd_stmt "$upd_stmt $sep path='$dbpath' "
      set sep ", "
  end

  if test $current -eq 0 -o $current -eq 1
      set upd_stmt "$upd_stmt $sep current=$current "
      set sep ", "
  end
  if test $active -eq 0 -o $active -eq 1
      set upd_stmt "$upd_stmt $sep active=$active "
      set sep ", "
  end
    set upd_stmt "$upd_stmt where shortname='$shortname' "
  echo Statement: $upd_stmt
  sqlite3 (__fd2_p2_sql_db_path) "$upd_stmt;"
end
# https://github.com/jorgebucaran/fish-getopts