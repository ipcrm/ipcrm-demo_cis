class demo_cis::controls::windows::server2012r2::cis_helpers {

  service{'cis-windows_firewall':
    ensure => running,
    name   => 'MpsSvc',
    enable => true,
  }


}
