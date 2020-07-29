set -q XDG_CONFIG_HOME || set -x XDG_CONFIG_HOME $HOME/.config

bind \co __fd2_p2_open

set -l name (basename (status -f) .fish){_uninstall}

function $name --on-event $name
    bind --erase \co
end

fd2_define_command -p p2 -d "fishdots plugin for working on projects"

fd2_define_subcommand -p p2 -c add -f __fd2_p2_add -d "add a new project to the master list"
fd2_define_subcommand -p p2 -c cd -f __fd2_p2_cd -d "<sn> change to home dir of project"
fd2_define_subcommand -p p2 -c cur -f __fd2_p2_cur -d "show the current project short name"
fd2_define_subcommand -p p2 -c del -f __fd2_p2_sql_delete_project -d "delete project (by shortname)"
fd2_define_subcommand -p p2 -c delall -f __fd2_p2_sql_delete_all_projects -d "delete every project"
fd2_define_subcommand -p p2 -c edit -f __fd2_p2_edit -d "edit in project home folder"
fd2_define_subcommand -p p2 -c goto -f __fd2_p2_goto -d "change projects and go to home dir of chosen project"
fd2_define_subcommand -p p2 -c home -f __fd2_p2_home -d "go to the root directory of the current project"
fd2_define_subcommand -p p2 -c ls -f __fd2_p2_ls -d "list all available projects"
fd2_define_subcommand -p p2 -c note -f __fd2_p2_note -d "if possible, create a project note"
fd2_define_subcommand -p p2 -c open -f __fd2_p2_open -d "select and switch to project"
fd2_define_subcommand -p p2 -c path -f __fd2_p2_path -d "get the root dir of the named project"
fd2_define_subcommand -p p2 -c quicksave -f __fd2_p2_quicksave -d "save and clean contents of project dir locally"
fd2_define_subcommand -p p2 -c quicksync -f __fd2_p2_quicksync -d "save and clean contents of project dir locally"
fd2_define_subcommand -p p2 -c save -f __fd2_p2_save -d "save contents of project dir locally"
fd2_define_subcommand -p p2 -c set -f __fd2_p2_set -d "change current project"
fd2_define_subcommand -p p2 -c sync -f __fd2_p2_sync -d "save project and push upstream"
fd2_define_subcommand -p p2 -c todo -f __fd2_p2_todo -d "create a task for this project"
