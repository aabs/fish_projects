function __fd2_p2_get_project_field  -d ""
    set -l pipe_delimited_result ''
    set -l fieldname ''

    getopts $argv | while read -l key value
        switch $key
            case f fieldname
                set fieldname $value
            case r result_string
                set pipe_delimited_result $value
        end
    end

    if test -z $fieldname
      error "field name must be set (use the -f option)" >&2
      return 1
    end
    if test -z $pipe_delimited_result
      error "result_string must be set (use the -r option)" >&2
      return 1
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

