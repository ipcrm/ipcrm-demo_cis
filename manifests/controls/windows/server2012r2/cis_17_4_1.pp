class demo_cis::controls::windows::server2012r2::cis_17_4_1 {

  auditpol { 'Directory Service Access':
    success => 'enable',
    failure => 'enable',
  }

}

