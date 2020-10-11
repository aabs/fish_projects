function __fd2_p2_switch_tmux_sessions
    if not functions -q tm
        echo "fish_tmux is not installed. Aborting." >&2
    end
    argparse 's/=+' -- $argv

    set -l shortname ''
    if test -z $_flag_s
        error "__fd2_p2_switch_current_project: shortname must be set (use the -s option)" >&2
        return 1
    else
        set shortname $_flag_s
    end

    if functions -q tm
        if contains $shortname (tm ls)
            tm goto -n $shortname
        else
            tm new -n $shortname
        end
    end
end

