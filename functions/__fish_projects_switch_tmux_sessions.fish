function __fish_projects_switch_tmux_session -a session_name
  if contains $session_name (tm ls)
    tm goto $session_name
  else
    tm new $session_name
  end
end

