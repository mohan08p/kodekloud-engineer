node 'stapp01.stratos.xfusioncorp.com', 'stapp02.stratos.xfusioncorp.com', 'stapp03.stratos.xfusioncorp.com' {
    include user
}

class user {
  user { 'ammar':
    ensure => present,
    comment => 'ammar user',
    home => '/home/ammar',
    managehome => true,
	uid => 1199
  }
}
