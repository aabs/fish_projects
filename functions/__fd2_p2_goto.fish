function __fd2_p2_goto -d "switch projects"
    set -l shortname ''

    argparse 's/=+' -- $argv

    if test -z $_flag_s
        error "__fd2_p2_cd: shortname must be set (use the -s option)" >&2
        return 1
    else
        set shortname $_flag_s
    end


    echo __fd2_p2_switch_current_project $shortname
    __fd2_p2_switch_current_project $shortname
    __fd2_p2_home
end
