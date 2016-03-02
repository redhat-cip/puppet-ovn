# ovn params
# == Class: ovn::params
#
# This class defines the variable like 

class ovn::params {
    case $::osfamily {
        'Redhat': {
            $ovn_package_name            = "openvswitch-ovn"
            $ovn_northd_service_name     = "ovn-northd"
            $ovn_controller_service_name = "ovn-controller"
        }
    }
}
