function __fd2_p2_sql_delete_all_projects -d "delete a project entry in the database"
  sqlite3 (__fd2_p2_sql_db_path) "delete from project;"
end
# https://github.com/jorgebucaran/fish-getopts