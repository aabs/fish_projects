function __fish_projects_myyq -d "uses docker to access the contents of the projects.yaml file"
  set -l prjfile (realpath $XDG_CONFIG_HOME/fish_projects/projects.yaml)
  yq r $prjfile $argv
end
