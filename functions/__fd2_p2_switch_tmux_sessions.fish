function __fd2_p2_switch_tmux_sessions
    if not functions -q tm
      echo "fish_tmux is not installed. Aborting." >&2
    end
    set -l shortname ''

    getopts $argv | while read -l key value
        switch $key
            case s shortname
                set shortname $value
        end
    end

    if test -z $shortname
      error "short name must be set (use the -s option)" >&2
      return 1
    end

  if functions -q tm
    if contains $shortname (tm ls)
      tm goto $shortname
    else
      tm new $shortname
    end
  end
end

