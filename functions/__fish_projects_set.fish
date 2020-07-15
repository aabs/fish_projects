function __fish_projects_set -a shortname
  test -z $shortname || set -U fish_projects_current_sn $shortname
end
