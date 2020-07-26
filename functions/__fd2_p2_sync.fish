function __fd2_p2_sync -d "commits any changes in current porject home dir to git and push to origin etc"
  if not functions -q fdg
    echo "fish_git is not installed. Aborting." >&2
  end
  __fd2_p2_cd -s $__fd2_p2_current_sn
  fdg sync "$argv"
end