function __fd2_p2_goto -d "switch projects"
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
  echo __fd2_p2_switch_current_project $shortname
  __fd2_p2_switch_current_project $shortname
  __fd2_p2_home
end
