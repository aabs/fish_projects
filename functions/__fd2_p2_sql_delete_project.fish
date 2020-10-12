function __fd2_p2_sql_delete_project -d "delete a project entry in the database"
    set -l options (fish_opt -s h -l help)
    set -l options $options (fish_opt -s s -l shortname -r)

    argparse -n "p2 del" -n 1 $options -- $argv
    or return

    if set -q _flag_help
        echo "usage: p2 del [<options>]"
        echo
        echo "  -h, --help                   display this"
        echo "  -s <short name>, --shortname=<short name>"
        echo "                               short name for the project (commonly used)"
        echo

        return 0
    end
    set -l shortname 0
    if test -z $_flag_s
        error "__fd2_p2_sql_delete_project: shortname must be set (use the -s option)" >&2
        return 1
    else
        set shortname $_flag_s
    end

    sqlite3 (__fd2_p2_sql_db_path) "delete from project where shortname = '$shortname';"
end