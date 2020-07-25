function __fd2_p2_cd
    set -l shortname ''
    trace "__fd2_p2_cd" >&2
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
    set -l p (__fd2_p2_sql_retrieve_project -s $shortname)
    set -l prjpath (__fd2_p2_get_project_field -f path -r $p)
    debug "going to $prjpath" >&2
    cd $prjpath
end
