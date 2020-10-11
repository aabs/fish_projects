set -q XDG_CONFIG_HOME || set -x XDG_CONFIG_HOME $HOME/.config

bind \cP __fd2_p2_open

set -l name (basename (status -f) .fish){_uninstall}

function $name --on-event $name
    bind --erase \cP
end