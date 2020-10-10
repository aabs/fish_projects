function __fd2_p2_switch_current_project

    argparse 's/=+' -- $argv

    set -l shortname ''
    if test -z $_flag_s
        error "__fd2_p2_switch_current_project: shortname must be set (use the -s option)" >&2
        return 1
    else
        set shortname $_flag_s
    end


    sqlite3 (__fd2_p2_sql_db_path) "update project set current=0 where current=1"
    __fd2_p2_sql_update_project -s  $shortname -c 1
    __fd2_p2_set -s $shortname
end

