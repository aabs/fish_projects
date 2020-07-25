function __fd2_p2_sql_retrieve_current_project -d "create a new project entry in the database"
    set -l shortname ''

    getopts $argv | while read -l key value
        switch $key
            case s shortname
                set shortname $value
        end
    end
# CREATE TABLE project(id varchar(4), title varchar(256), description varchar(1024), 
#    path varchar(1024), shortname varchar(16), active boolean, current boolean);
  set -l active 1
  set -l current 0
  sqlite3 (__fd2_p2_sql_db_path) "select id, title, description, path, shortname, active, current from project where current=1;"
end
# https://github.com/jorgebucaran/fish-getopts