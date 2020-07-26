function __fd2_p2_sql_create_project -d "create a new project entry in the database"
    set -l id 0
    set -l title ''
    set -l desc ''
    set -l dbpath ''
    set -l shortname ''

    debug "__fd2_p2_sql_create_project args: $argv"

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
        end
    end
# CREATE TABLE project(id varchar(4), title varchar(256), description varchar(1024), 
#    path varchar(1024), shortname varchar(16), active boolean, current boolean);
  set -l active 1
  set -l current 0
  sqlite3 (__fd2_p2_sql_db_path) "insert into project (id, title, description, path, shortname, active, current) values ( '$id', '$title', '$desc', '$dbpath', '$shortname', $active, $current );"
end
# https://github.com/jorgebucaran/fish-getopts