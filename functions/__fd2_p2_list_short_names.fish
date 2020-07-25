function __fd2_p2_list_short_names
  sqlite3 (__fd2_p2_sql_db_path) "select shortname from project where active=1;"
end
