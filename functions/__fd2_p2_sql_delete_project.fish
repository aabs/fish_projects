function __fd2_p2_sql_delete_project -d "delete a project entry in the database"
    argparse 's/=+' -- $argv

    set -l shortname 0
    if test -z $_flag_s
        error "__fd2_p2_sql_delete_project: shortname must be set (use the -s option)" >&2
        return 1
    else
        set shortname $_flag_s
    end

    sqlite3 (__fd2_p2_sql_db_path) "delete from project where shortname = '$shortname';"
end