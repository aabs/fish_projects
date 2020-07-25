function __fd2_p2_sql_retrieve_all_projects -d "create a new project entry in the database"
  sqlite3 (__fd2_p2_sql_db_path) "select id, title, description, path, shortname, active, current from project ;"
end
# https://github.com/jorgebucaran/fish-getopts