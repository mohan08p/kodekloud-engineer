#### Puppet Setup SSH Keys

node 'stapp01.stratos.xfusioncorp.com' {
    include ssh_node1
}
node 'stapp02.stratos.xfusioncorp.com' {
    include ssh_node2
}
node 'stapp03.stratos.xfusioncorp.com' {
    include ssh_node3
}

class ssh_node1 {
    ssh_authorized_key { 'root@jump_host':
        ensure => present,
        user => 'tony',
        type => 'ssh-rsa',
        key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCqMWxj1XwglDg2ug1O7OB78lsmA91mi7URN5BbV3x4RYR/iEr0rdw32/Jx4iFwevyyXeoIQfbmzMgRFDeav8S4Nby/LPHpYC8bBWJ3kNKU+ROONgMp6d5xjswNLz52TEeNY/FBSTiJJjjHAaFDLxerc8ROpWeNAOH2BaySqtZu502hGKcb+1YLvAuoElsWf8Z5g3qTjcGCvWfmU2r1dN+iRPB0yxU1sws0dBFONGZHJPs+HfQzdBG11XoSOEUcgnqqd1wEx9y0n+NuPo9oD3W6kyUu6rN5b9SHHE+eOkdYpqLDxlNX9rR6mf7AzguSToZS4XzJPCf7eJrpzRiplyXH',
    }
}

class ssh_node2 {
    ssh_authorized_key { 'root@jump_host':
        ensure => present,
        user => 'steve',
        type => 'ssh-rsa',
        key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCqMWxj1XwglDg2ug1O7OB78lsmA91mi7URN5BbV3x4RYR/iEr0rdw32/Jx4iFwevyyXeoIQfbmzMgRFDeav8S4Nby/LPHpYC8bBWJ3kNKU+ROONgMp6d5xjswNLz52TEeNY/FBSTiJJjjHAaFDLxerc8ROpWeNAOH2BaySqtZu502hGKcb+1YLvAuoElsWf8Z5g3qTjcGCvWfmU2r1dN+iRPB0yxU1sws0dBFONGZHJPs+HfQzdBG11XoSOEUcgnqqd1wEx9y0n+NuPo9oD3W6kyUu6rN5b9SHHE+eOkdYpqLDxlNX9rR6mf7AzguSToZS4XzJPCf7eJrpzRiplyXH',
    }
}

class ssh_node3 {
    ssh_authorized_key { 'root@jump_host':
        ensure => present,
        user => 'banner',
        type => 'ssh-rsa',
        key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCqMWxj1XwglDg2ug1O7OB78lsmA91mi7URN5BbV3x4RYR/iEr0rdw32/Jx4iFwevyyXeoIQfbmzMgRFDeav8S4Nby/LPHpYC8bBWJ3kNKU+ROONgMp6d5xjswNLz52TEeNY/FBSTiJJjjHAaFDLxerc8ROpWeNAOH2BaySqtZu502hGKcb+1YLvAuoElsWf8Z5g3qTjcGCvWfmU2r1dN+iRPB0yxU1sws0dBFONGZHJPs+HfQzdBG11XoSOEUcgnqqd1wEx9y0n+NuPo9oD3W6kyUu6rN5b9SHHE+eOkdYpqLDxlNX9rR6mf7AzguSToZS4XzJPCf7eJrpzRiplyXH',
    }
}
