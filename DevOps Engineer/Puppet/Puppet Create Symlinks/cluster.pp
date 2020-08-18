class symlink {

    file { '/opt/finance':
      ensure  => 'link',
      target => '/var/www/html',
    }
	
	file { '/opt/finance/blog.txt':
      ensure  => 'present',
      replace => 'no', # this is the important property
      mode    => '0744',
    }

}

include symlink
