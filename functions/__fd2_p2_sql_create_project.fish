function __fd2_p2_sql_create_project -d "create a new project entry in the database"

    set -l options (fish_opt -s h -l help -o)
    set -l options $options (fish_opt -s i -l id -r)
    set -l options $options (fish_opt -s t -l title -r)
    set -l options $options (fish_opt -s d -l desc -r)
    set -l options $options (fish_opt -s p -l dbpath -r)
    set -l options $options (fish_opt -s s -l shortname -r)

    argparse $options -- $argv

    if test -z $_flag_h
        echo "__fd2_p2_sql_create_project help text"
        return 0
    end

    set -l id 0
    if test -z $_flag_i
        error "__fd2_p2_sql_create_project: id must be set (use the -i option)" >&2
        return 1
    else
        set id $_flag_i
    end

    set -l title ''
    if test -z $_flag_t
        error "__fd2_p2_sql_create_project: title must be set (use the -t option)" >&2
        return 1
    else
        set title $_flag_t
    end

    set -l desc ''
    if test -z $_flag_s
        error "__fd2_p2_sql_create_project: desc must be set (use the -d option)" >&2
        return 1
    else
        set desc $_flag_s
    end

    set -l dbpath ''
    if test -z $_flag_p
        error "__fd2_p2_sql_create_project: dbpath must be set (use the -p option)" >&2
        return 1
    else
        set dbpath $_flag_p
    end

    set -l shortname ''
    if test -z $_flag_s
        error "__fd2_p2_sql_create_project: shortname must be set (use the -s option)" >&2
        return 1
    else
        set shortname $_flag_s
    end




    debug "__fd2_p2_sql_create_project args: $argv"

# CREATE TABLE project(id varchar(4), title varchar(256), description varchar(1024), 
#    path varchar(1024), shortname varchar(16), active boolean, current boolean);
  set -l active 1
  set -l current 0
  sqlite3 (__fd2_p2_sql_db_path) "insert into project (id, title, description, path, shortname, active, current) values ( '$id', '$title', '$desc', '$dbpath', '$shortname', $active, $current );"
end