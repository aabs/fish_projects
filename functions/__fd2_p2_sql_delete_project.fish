function __fd2_p2_sql_delete_project -d "delete a project entry in the database"
    set -l shortname ''

    getopts $argv | while read -l key value
        switch $key
            case s shortname
                set shortname $value
        end
    end

  sqlite3 (__fd2_p2_sql_db_path) "delete from project where shortname = '$shortname';"
end
# https://github.com/jorgebucaran/fish-getopts