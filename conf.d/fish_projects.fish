set -q XDG_CONFIG_HOME || set -x XDG_CONFIG_HOME $HOME/.config
functions -q define_subcommand_nonevented || cat ~/.fishdots/init/rc0.d/04-commands.fish | source 
functions -q fdecho || cat ~/.fishdots/init/helpers.fish | source 

bind \co fish_projects_open

set -l name (basename (status -f) .fish){_uninstall}

function $name --on-event $name
    bind --erase \co
end

define_command p2 "fishdots plugin for working on projects"

define_subcommand_nonevented p2 add fish_projects_add "add a new project to the master list"
define_subcommand_nonevented p2 cd fish_projects_cd "<sn> change to home dir of project"
define_subcommand_nonevented p2 cur fish_projects_cur "show the current project short name"
define_subcommand_nonevented p2 edit fish_projects_edit "edit in project home folder"
define_subcommand_nonevented p2 goto fish_projects_goto "change projects and go to home dir of chosen project"
define_subcommand_nonevented p2 home fish_projects_home "go to the root directory of the current project"
define_subcommand_nonevented p2 ls fish_projects_ls "list all available projects"
define_subcommand_nonevented p2 open fish_projects_open "select and switch to project"
define_subcommand_nonevented p2 path __fish_projects_path "get the root dir of the named project"
define_subcommand_nonevented p2 quicksave fish_projects_save "save and clean contents of project dir locally"
define_subcommand_nonevented p2 set __fish_projects_set "change current project"
define_subcommand_nonevented p2 save fish_projects_save "save contents of project dir locally"
define_subcommand_nonevented p2 sync fish_projects_sync "save project and push upstream"
define_subcommand_nonevented p2 todo fish_projects_todo "create a task for this project"
define_subcommand_nonevented p2 purge fish_projects_purge "remove all project config data"
