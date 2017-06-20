class demo_cis::controls::windows::server2012r2::cis_helpers(
  $create_service_helper = false,
){

  if $create_service_helper == true {
    service{'windows_firewall':
      ensure => running,
      name   => 'MpsSvc',
      enable => true,
    }
  }


}
