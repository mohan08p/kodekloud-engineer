node "stapp01.stratos.xfusioncorp.com", "stapp02.stratos.xfusioncorp.com", "stapp03.stratos.xfusioncorp.com" {
  include mymodule
}

class mymodule {

  archive { '/opt/beta/beta.zip':
    ensure => present,
    extract => true,
    extract_path => '/opt/beta',
    source => '/usr/src/beta/beta.zip',
    cleanup => true,
  }
}
