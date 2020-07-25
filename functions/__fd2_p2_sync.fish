function __fd2_p2_sync -d "commits any changes in current porject home dir to git and push to origin etc"
  if functions -q fdg
  __fd2_p2_cd $__fd2_p2_current_sn
  fdg sync "$argv"
  end
end

