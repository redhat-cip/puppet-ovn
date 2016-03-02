# ovn controller
# == Class: ovn::controller
#
# installs ovn and starts the ovn-controller service
#
# === Parameters:
#
# [*ovn_remote*]
#   URL of the remote ovsdb-server that manages ovn-nb and ovn-sb dbs
#
# [*ovn_enap_type*]
#   (Optional) The encapsulation type to be used
#   Defaults to 'geneve'
#
# [*ovn_ecap_ip*]
#   IP address of the hypervisor(in which this module is installed) to which
#   the other controllers would use to create a tunnel to this controller
#
class ovn::controller(
    $ovn_remote = undef,
    $ovn_encap_type = "geneve",
    $ovn_encap_ip = undef
) {
    include ovn::params
    include vswitch

    service { 'controller':
        name   => $::ovn::params::ovn_controller_service_name,
        ensure => true,
        enable => true,
        require => [Vs_config['external_ids:ovn-remote'],
                    Vs_config['external_ids:ovn-encap-type'],
                    Vs_config['external_ids:ovn-encap-ip']]                   
    }

    package { 'controller':
        name   => $::ovn::params::ovn_package_name,
        ensure => present,
        before => Service['controller']
    }

    vs_config { 'external_ids:ovn-remote':
        ensure  => present,
        value   => $ovn_remote,
        require => Service['openvswitch'],
    }

    vs_config { "external_ids:ovn-encap-type":
        ensure  => present,
        value   => $ovn_encap_type,
        require => Service['openvswitch'],
    }

    vs_config { "external_ids:ovn-encap-ip":
        ensure  => present,
        value   => $ovn_encap_ip,
        require => Service['openvswitch'],
    }
}
