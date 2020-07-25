function __fd2_p2_note -d "create a project note if note plugin is available"
    if not functions -q n2
      echo "fish_note is not installed. Aborting." >&2
    end
    set -l title ''

    getopts $argv | while read -l key value
        switch $key
            case s title
                set title $value
        end
    end

    if test -z $title
      echo "title must be set (use the -t option)" >&2
      return 1
    end

    n2 pcreate "$__fd2_p2_current_sn $argv"
end
