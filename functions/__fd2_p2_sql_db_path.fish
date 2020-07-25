function __fd2_p2_sql_db_path -d "get path to local database"
  set -q XDG_CONFIG_HOME || set -x XDG_CONFIG_HOME $HOME/.config
  set -l result $XDG_CONFIG_HOME/fishdots/projects.db
  if not test -e $result
    warn "local db not present" >&2
  end
  echo $result
end