node "stapp01.stratos.xfusioncorp.com", "stapp02.stratos.xfusioncorp.com", "stapp03.stratos.xfusioncorp.com" {
  include ntpconfig
}

class ntpconfig {
  include ntp
}

class { 'ntp':
  servers => ['2.oceania.pool.ntp.org'],
}
