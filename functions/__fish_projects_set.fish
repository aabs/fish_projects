function __fish_projects_set -a shortname
  set -q shortname || set -U fish_projects_current_sn $shortname
end
