function __fd_projects_myyq -d "uses docker to access the contents of the projects.yaml file"
  docker run --rm -i -v (pwd):/workdir mikefarah/yq:3 yq r $XDG_CONFIG_HOME/fish_projects/projects.yaml $argv
end
