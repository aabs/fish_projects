function fish_projects_add -d '<name> <desc>  add a record to fd boot loader'
  set -l name $argv[1]
  set -l desc $argv[2..-1]
  echo -e "  - $name:\n    shortname: $name\n    path: $PWD\n    description: $desc\n" >> $XDG_CONFIG_HOME/fish_projects/projects.yaml
end
