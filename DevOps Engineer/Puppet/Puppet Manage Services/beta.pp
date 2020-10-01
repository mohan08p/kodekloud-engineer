node 'stapp01.stratos.xfusioncorp.com', 'stapp02.stratos.xfusioncorp.com', 'stapp03.stratos.xfusioncorp.com' {
    include vsftpd_package
}

class vsftpd_package {
    package { 'vsftpd':
    	ensure => installed,
    }
    service { 'vsftpd':
        ensure => running,
	require => Package['vsftpd'],
        enable => true,
    }
}
