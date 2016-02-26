class ovn::northd() {
    include ovn::params
    service { 'northd':
        ensure => true,
        enable => true,
        name   => $::ovn::params::ovn_northd_service_name
    }

    package { 'ovn':
        name   => $::ovn::params::ovn_package_name,
        ensure => 'present',
        before => Service['northd']
    }
}
