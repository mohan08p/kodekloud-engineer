node "stapp01.stratos.xfusioncorp.com" {
  include multi_package_node
}

class multi_package_node {

$multi_package = [ 'vim-enhanced', 'zip']

    package { $multi_package: ensure => 'installed' }

}