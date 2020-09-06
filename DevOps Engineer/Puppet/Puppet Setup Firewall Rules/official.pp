class firewall_node1 {
 firewalld_rich_rule { 'Open all incoming connection for 5000/tcp port on App Server 1':
  ensure => present,
  zone   => 'public',
  log => {
    'level' => 'debug',
    'prefix' => 'puppetFirewallD'
  },
  port => {
   'port' => 5000,
   'protocol' => 'tcp'
  },
  action  => 'accept',
 }
}

class firewall_node2 {
 firewalld_rich_rule { 'Open all incoming connection for 9006/tcp port on App Server 1':
  ensure => present,
  zone   => 'public',
  log => {
    'level' => 'debug',
    'prefix' => 'puppetFirewallD'
  },
  port => {
   'port' => 9006,
   'protocol' => 'tcp'
  },
  action  => 'accept',
 }
}

class firewall_node3 {
 firewalld_rich_rule { 'Open all incoming connection for 8092/tcp port on App Server 3':
  ensure => present,
  zone   => 'public',
  log => {
    'level' => 'debug',
    'prefix' => 'puppetFirewallD'
  },
  port => {
   'port' => 8092,
   'protocol' => 'tcp'
  },
  action  => 'accept',
 }
}
