function fish_projects_todo -d "emits event for task, to be picked up elsewhere"
  emit on_project_task "$fish_projects_current_sn $argv"
end

