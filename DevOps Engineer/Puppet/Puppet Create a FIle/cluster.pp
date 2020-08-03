class create_file {

    file { '/opt/sysops/ecommerce.txt':
      ensure  => 'present',
      replace => 'no', # this is the important property
      content => "",
      mode    => '0644',
    }

}

include create_file
