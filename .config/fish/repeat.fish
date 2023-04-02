function repeat -a n cmd -d 'executes a command n times'
  if test -z $cmd
    echo "please provide command to execute"
    return 2
  end

  if test $n -le 0
    echo "can't execute $cmd $n times"
    return 2
  end

  while test $n -gt 0;
    $cmd $argv[3..];
    set n (math $n - 1);
  end;
end
