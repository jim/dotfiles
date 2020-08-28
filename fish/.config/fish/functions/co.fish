function co
  set needle $argv
  if test -z $needle
    echo "You must specify text to search for."
    return
  end
  set branch (git branch | grep $needle | sed 's/[ \*]//g' | string split "\n")
  if test (count $branch) -gt 1
    echo "More than 1 branch matched:"
    for br in $branch
      echo "  " $br
    end
    return
  end
  if test -z $branch
    git fetch origin
    set branch (git branch -a | grep $needle | sed 's/[ \*]//g' | sed 's/remotes\/origin\///g' | string split "\n")
    if test -z $branch
      echo "No branch found matching '$needle'."
      return
    end
    if test (count $branch) -gt 1
      echo "More than 1 branch matched:"
      for br in $branch
        echo "  " $br
      end
      return
    end
  end

  git checkout $branch
end
