class demo_cis::controls::windows::server2012r2::cis_helpers {

  if !defined(Service['windows_firewall'])
    service{'windows_firewall':
      ensure => running,
      name   => 'MpsSvc',
      enable => true,
    }
  }


}
