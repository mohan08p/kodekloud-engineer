class file_permission_change {

    file { '/opt/sysops/beta.txt':
      ensure  => 'present',
      replace => 'yes', # this is the important property
      content => "Welcome to xFusionCorp Industries!",
      mode    => '0744',
    }

}

include file_permission_change
