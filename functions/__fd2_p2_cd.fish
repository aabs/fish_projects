function __fd2_p2_cd
    trace "__fd2_p2_cd" >&2
    set -l shortname ''

    argparse 's/=+' -- $argv

    if test -z $_flag_s
        error "__fd2_p2_cd: shortname must be set (use the -s option)" >&2
        return 1
    else
        set shortname $_flag_s
    end

    set -l p (__fd2_p2_sql_retrieve_project -s $shortname)
    set -l prjpath (__fd2_p2_get_project_field -f path -r $p)
    debug "going to $prjpath" >&2
    cd $prjpath
end
