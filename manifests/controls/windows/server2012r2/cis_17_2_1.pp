class demo_cis::controls::windows::server2012r2::cis_17_2_1 {

  auditpol { 'Application Group Management':
    success => 'enable',
    failure => 'enable',
  }

}

