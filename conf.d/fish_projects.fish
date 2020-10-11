set -q XDG_CONFIG_HOME || set -x XDG_CONFIG_HOME $HOME/.config

bind \co __fd2_p2_open

set -l name (basename (status -f) .fish){_uninstall}

function $name --on-event $name
    bind --erase \co
end
