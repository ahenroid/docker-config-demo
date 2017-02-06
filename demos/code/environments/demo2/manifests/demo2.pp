
user { 'andy.henroid':
  ensure     => 'present',
  managehome => 'true',
  password   => '$1$kIneuJ4A$qnxMk.KLMV28OBZsMlIXt.',
}

class { 'ssh':
  sshd_password_authentication => 'yes',
}
