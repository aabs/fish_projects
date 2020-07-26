function __fd2_p2_edit -d "goto home dir of project and start editor"
  __fd2_p2_cd -s $__fd2_p2_current_sn
  eval "$EDITOR ."
end
