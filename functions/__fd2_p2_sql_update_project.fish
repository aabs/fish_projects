function __fd2_p2_sql_update_project -d "update a project entry in the database, identified by project shortname which may not be changed"

    set -l options (fish_opt -s h -l help)
    set -l options $options (fish_opt -s i -l id -r)
    set -l options $options (fish_opt -s t -l title -r)
    set -l options $options (fish_opt -s d -l desc -r)
    set -l options $options (fish_opt -s p -l dbpath -r)
    set -l options $options (fish_opt -s s -l shortname -r)
    set -l options $options (fish_opt -s a -l active -r)
    set -l options $options (fish_opt -s c -l current -r)

    argparse -n "p2 update" -N 1 $options -- $argv
    or return

    if set -q _flag_help
        echo "usage: p2 update [<options>]"
        echo

        echo "  -h, --help                   display this"
        echo "  -a (0|1), --active=(0|1)     is project being worked on?"
        echo "  -c (0|1), --current=(0|1)    is project actively in use, right now?"
        echo "  -i <id>, --id=<id>           numeric code for project"
        echo "  -t <title>, --title=<title>  brief summary of project"
        echo "  -d <desc>, --desc=<desc>     description of the project"
        echo "  -p <path>, --dbpath=<path>   path to the project folder"
        echo "  -s <short name>, --shortname=<short name>"
        echo "                               short name for the project (commonly used)"
        echo

        return 0
    end

    set -l id 0
    if test -z $_flag_i
        error "__fd2_p2_sql_update_project: id must be set (use the -i option)" >&2
        return 1
    else
        set id $_flag_i
    end

    set -l title ''
    if test -z $_flag_t
        error "__fd2_p2_sql_update_project: title must be set (use the -t option)" >&2
        return 1
    else
        set title $_flag_t
    end

    set -l desc ''
    if test -z $_flag_s
        error "__fd2_p2_sql_update_project: desc must be set (use the -d option)" >&2
        return 1
    else
        set desc $_flag_s
    end

    set -l dbpath ''
    if test -z $_flag_p
        error "__fd2_p2_sql_update_project: dbpath must be set (use the -p option)" >&2
        return 1
    else
        set dbpath $_flag_p
    end

    set -l shortname ''
    if test -z $_flag_s
        error "__fd2_p2_sql_update_project: shortname must be set (use the -s option)" >&2
        return 1
    else
        set shortname $_flag_s
    end

    set -l active ''
    if test -z $_flag_a
        error "__fd2_p2_sql_update_project: active must be set (use the -a option)" >&2
        return 1
    else
        set active $_flag_a
    end

    set -l current ''
    if test -z $_flag_c
        error "__fd2_p2_sql_update_project: current must be set (use the -c option)" >&2
        return 1
    else
        set current $_flag_c
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
