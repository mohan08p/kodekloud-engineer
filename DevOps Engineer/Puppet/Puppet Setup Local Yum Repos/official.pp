class local_yum_repo {
  
  yumrepo { 'localyum':
    enabled => 1,
    name => 'epel_local',
    baseurl => 'file:///packages/downloaded_rpms',
  }

  package { 'vsftpd':
    ensure => 'installed',
    require => Yumrepo['localyum'],
  }
}

include local_yum_repo
