class ovn::controller(
    $ovn_remote = undef
) {
    include ovn::params
    include vswitch

    service { 'controller':
        name   => $::ovn::params::ovn_controller_service_name,
        ensure => true,
        enable => true,
        require => Exec['ovn-remote']
    }

    package { 'controller':
        name   => $::ovn::params::ovn_package_name,
        ensure => present,
        before => Service['controller']
    }

    exec { 'ovn-remote':
        command  => "ovs-vsctl set open . external-ids:ovn-remote=$ovn_remote",
        onlyif   => "test `ovs-vsctl get open . external_ids:ovn-remote 2> /dev/null` != $ovn_remote",
        require  => Service['openvswitch'],
        path     => "/usr/bin:/usr/sbin"
    }

    vs_bridge {"br-int":
        ensure => present,
        subscribe => Service['controller']
    }
}
