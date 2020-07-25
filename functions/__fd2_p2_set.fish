function __fd2_p2_set
  set -l shortname ''

  getopts $argv | while read -l key value
      switch $key
          case s shortname
              set shortname $value
      end
  end

  if test -z $shortname
    error "short name must be set (use the -s option)" >&2
    return 1
  end

  set -U __fd2_p2_current_sn $shortname
end
