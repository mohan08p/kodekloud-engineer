node "stapp01.stratos.xfusioncorp.com", "stapp02.stratos.xfusioncorp.com", "stapp03.stratos.xfusioncorp.com" {
  include mymodule
}

class mymodule {

  package { 'epel-release':
    ensure => 'installed',
  }

  package { 'nginx':
    ensure  => 'installed',
    require => Package['epel-release'],
  }
}
