node 'stdb01.stratos.xfusioncorp.com' {
    include mysql_database
}

class mysql_database {
    package { 'mariadb-server':
        ensure => installed,
    }
    service { 'mariadb':
        ensure => running,
        enable => true,
    }
    mysql::db { 'kodekloud_db8':
        user => 'kodekloud_cap',
        password => 'GyQkFRVNr3',
        host => 'localhost',
        grant => ['ALL']
    }
}
