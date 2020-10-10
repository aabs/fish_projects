function __fd2_p2_note -d "create a project note if note plugin is available"
    if not functions -q n2
      echo "fish_note is not installed. Aborting." >&2
    end
    set -l title ''

    argparse 't/=+' -- $argv

    if test -z $_flag_t
        error "__fd2_p2_cd: title must be set (use the -s option)" >&2
        return 1
    else
        set title $_flag_t
    end

    n2 pcreate -t "$__fd2_p2_current_sn $argv"
end
