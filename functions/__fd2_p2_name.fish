function __fd2_p2_name
    set -l shortname ''

    argparse 's/=+' -- $argv

    if test -z $_flag_s
        error "__fd2_p2_cd: shortname must be set (use the -s option)" >&2
        return 1
    else
        set shortname $_flag_s
    end



    set -l p (__fd2_p2_sql_retrieve_project -s $shortname)
    __fd2_p2_get_project_field -f title -r $p
end
