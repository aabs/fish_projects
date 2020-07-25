function __fd2_p2_save -d "commits any changes in current porject home dir to git with msg from argv"
  if functions -q fdg 
    __fd2_p2_cd $__fd2_p2_current_sn
    fdg save "$argv"
    prevd
  end
end
