function fish_projects_note -d "create a project note if note plugin is available"
  if functions -q note
    note pcreate "$fish_projects_current_sn $argv"
  end
end
