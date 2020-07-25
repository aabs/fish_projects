function __fd2_p2_switch_current_project
    set -l shortname ''

    getopts $argv | while read -l key value
        switch $key
            case s shortname
                set shortname $value
        end
    end

    if test -z $shortname
      error "short name must be set (use the -s option)" >&2
      return 1
    end

    sqlite3 (__fd2_p2_sql_db_path) "update project set current=0 where current=1"
    __fd2_p2_sql_update_project -s  $shortname -c 1
    __fd2_p2_set -s $shortname
end

