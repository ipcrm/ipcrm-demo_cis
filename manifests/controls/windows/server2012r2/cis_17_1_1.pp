class demo_cis::controls::windows::server2012r2::cis_17_1_1 {

  auditpol { 'Credential Validation':
    success => 'enable',
    failure => 'enable',
  }

}

