class demo_cis::controls::windows::server2012r2::cis_1_1_1 {

  service{'cis-windows_firewall':
    ensure => running,
    name   => 'MpsSvc',
    enable => true,
  }


}
