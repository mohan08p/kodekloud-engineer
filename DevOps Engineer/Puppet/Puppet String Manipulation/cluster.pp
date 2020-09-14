#### Puppet String Manipulation

node 'stapp02.stratos.xfusioncorp.com' {
    include line_replace
}

class line_replace {
  file { '/opt/itadmin/cluster.txt':
    ensure => present,
    } -> 
  file_line { 'replace':
	  path => '/opt/itadmin/cluster.txt',
	  line => 'Welcome to xFusionCorp Industries!',
	  match => 'Welcome to Nautilus Industries!',
  }
}
