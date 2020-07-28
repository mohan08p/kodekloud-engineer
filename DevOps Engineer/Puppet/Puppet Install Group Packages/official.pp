class yum_group {

  # list the available groups with yum grouplist
  yum::group { 'Security Tools':
    ensure  => present,
    timeout => 300,
  }

}

include yum_group
