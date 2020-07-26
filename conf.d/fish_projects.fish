set -q XDG_CONFIG_HOME || set -x XDG_CONFIG_HOME $HOME/.config

bind \co __fd2_p2_open

set -l name (basename (status -f) .fish){_uninstall}

function $name --on-event $name
    bind --erase \co
end

fd2_define_command p2 "fishdots plugin for working on projects"

fd2_define_subcommand p2 add __fd2_p2_add "add a new project to the master list"
fd2_define_subcommand p2 cd __fd2_p2_cd "<sn> change to home dir of project"
fd2_define_subcommand p2 cur __fd2_p2_cur "show the current project short name"
fd2_define_subcommand p2 del __fd2_p2_sql_delete_project "delete project (by shortname)"
fd2_define_subcommand p2 delall __fd2_p2_sql_delete_all_projects "delete every project"
fd2_define_subcommand p2 edit __fd2_p2_edit "edit in project home folder"
fd2_define_subcommand p2 goto __fd2_p2_goto "change projects and go to home dir of chosen project"
fd2_define_subcommand p2 home __fd2_p2_home "go to the root directory of the current project"
fd2_define_subcommand p2 ls __fd2_p2_ls "list all available projects"
fd2_define_subcommand p2 note __fd2_p2_note "if possible, create a project note"
fd2_define_subcommand p2 open __fd2_p2_open "select and switch to project"
fd2_define_subcommand p2 path __fd2_p2_path "get the root dir of the named project"
fd2_define_subcommand p2 quicksave __fd2_p2_quicksave "save and clean contents of project dir locally"
fd2_define_subcommand p2 quicksync __fd2_p2_quicksync "save and clean contents of project dir locally"
fd2_define_subcommand p2 save __fd2_p2_save "save contents of project dir locally"
fd2_define_subcommand p2 set __fd2_p2_set "change current project"
fd2_define_subcommand p2 sync __fd2_p2_sync "save project and push upstream"
fd2_define_subcommand p2 todo __fd2_p2_todo "create a task for this project"
