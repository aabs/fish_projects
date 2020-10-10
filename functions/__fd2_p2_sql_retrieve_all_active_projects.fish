function __fd2_p2_sql_retrieve_all_active_projects -d "create a new project entry in the database"
    argparse 's/=+' -- $argv

    set -l shortname 0
    if test -z $_flag_s
        error "__fd2_p2_sql_create_project: shortname must be set (use the -s option)" >&2
        return 1
    else
        set shortname $_flag_s
    end
    # CREATE TABLE project(id varchar(4), title varchar(256), description varchar(1024), 
    #    path varchar(1024), shortname varchar(16), active boolean, current boolean);
    set -l active 1
    set -l current 0
    sqlite3 (__fd2_p2_sql_db_path) "select id, title, description, path, shortname, active, current from project where active=1;"
end
