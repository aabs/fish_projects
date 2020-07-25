function __fd2_p2_open -d "select from existing projects"
  __fd2_p2_select 
  if set -q __fd2_p2_selected 
    __fd2_p2_goto -s $__fd2_p2_selected
  end
end

