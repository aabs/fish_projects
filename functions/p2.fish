function p2 -d 'dispatcher for p2 functions'
    set l (count $argv)
    if test $l -eq 0
        p2_help
        return
    end

    set myargv ''
    for x in $argv[2..10]
        switch $x
            case "* *"
                set myargv "$myargv \"$x\""
            case '*'
                set myargv "$myargv $x"
        end
    end

    switch $argv[1]
        case add
            eval "__fd2_p2_add $myargv"
        case cd
            eval "__fd2_p2_cd $myargv"
        case cur
            eval "__fd2_p2_cur $myargv"
        case del
            eval "__fd2_p2_sql_delete_project $myargv"
        case delall
            eval "__fd2_p2_sql_delete_all_projects $myargv"
        case edit
            eval "__fd2_p2_edit $myargv"
        case goto
            eval "__fd2_p2_goto $myargv"
        case home
            eval "__fd2_p2_home $myargv"
        case ls
            eval "__fd2_p2_ls $myargv"
        case note
            eval "__fd2_p2_note $myargv"
        case open
            eval "__fd2_p2_open $myargv"
        case path
            eval "__fd2_p2_path $myargv"
        case quicksave
            eval "__fd2_p2_quicksave $myargv"
        case quicksync
            eval "__fd2_p2_quicksync $myargv"
        case save
            eval "__fd2_p2_save $myargv"
        case set
            eval "__fd2_p2_set $myargv"
        case sync
            eval "__fd2_p2_sync $myargv"
        case todo
            eval "__fd2_p2_todo $myargv"
        case '*'
            p2_help
    end

end

function p2_help
    echo "usage: p2 <cmd> [-s <shortname>]"
    echo
    echo "p2 has various commands for creating and working with projects:"
    echo
    echo "    add       add a new project to the master list"
    echo "    cd        <sn> change to home dir of project"
    echo "    cur       show the current project short name"
    echo "    del       delete project (by shortname)"
    echo "    delall    delete every project"
    echo "    edit      edit in project home folder"
    echo "    goto      change projects and go to home dir of chosen project"
    echo "    home      go to the root directory of the current project"
    echo "    ls        list all available projects"
    echo "    note      if possible, create a project note"
    echo "    open      select and switch to project"
    echo "    path      get the root dir of the named project"
    echo "    quicksave save and clean contents of project dir locally"
    echo "    quicksync save and clean contents of project dir locally"
    echo "    save      save contents of project dir locally"
    echo "    set       change current project"
    echo "    sync      save project and push upstream"
    echo "    todo      create a task for this project"
end