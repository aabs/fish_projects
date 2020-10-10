function __fd2_p2_set
    set -l shortname ''

    argparse 's/=+' -- $argv

    if test -z $_flag_s
        error "__fd2_p2_cd: shortname must be set (use the -s option)" >&2
        return 1
    else
        set shortname $_flag_s
    end



  set -U __fd2_p2_current_sn $shortname
end
