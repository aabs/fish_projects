function __fd2_p2_sql_retrieve_project -d "create a new project entry in the database"
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


  sqlite3 (__fd2_p2_sql_db_path) "select id, title, description, path, shortname, active, current from project where shortname = '$shortname';"
end
# https://github.com/jorgebucaran/fish-getopts