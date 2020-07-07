bind \co fish_projects_open

set -l name (basename (status -f) .fish){_uninstall}

function $name --on-event $name
    bind --erase \co
end

