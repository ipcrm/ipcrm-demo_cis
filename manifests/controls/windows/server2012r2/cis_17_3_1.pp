class demo_cis::controls::windows::server2012r2::cis_17_3_1 {

  auditpol { 'Process Creation':
    success => 'enable',
    failure => 'enable',
  }

}

