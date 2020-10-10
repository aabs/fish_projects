function __fd2_p2_get_project_field  -d ""
    set -l pipe_delimited_result ''
    set -l fieldname ''

    argparse 'f/=+' 'r/=+' -- $argv

    if test -z $_flag_f
        error "__fd2_p2_get_project_field: fieldname must be set (use the -s option)" >&2
        return 1
    else
        set fieldname $_flag_f
    end

    if test -z $_flag_r
        error "__fd2_p2_get_project_field: pipe_delimited_result must be set (use the -s option)" >&2
        return 1
    else
        set pipe_delimited_result $_flag_r
    end

    set fields (string split '|' $pipe_delimited_result)
    switch $fieldname
        
        case id    
            echo $fields[1]
        case title 
            echo $fields[2]
        case description    
            echo $fields[3]
        case path  
            echo $fields[4]
        case shortname   
            echo $fields[5]
        case active   
            echo $fields[6]
        case current
            echo $fields[7]
    end
end

