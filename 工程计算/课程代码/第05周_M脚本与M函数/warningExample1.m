function warningExample1
  if ~strncmp(version, '7', 1)
    warning('You are using a version other than v7')
  end