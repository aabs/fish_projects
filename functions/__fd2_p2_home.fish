function __fd2_p2_home -d "goto home dir of current project"
  __fd2_p2_cd -s $__fd2_p2_current_sn
  __fd2_p2_switch_tmux_sessions -s $__fd2_p2_current_sn
end
