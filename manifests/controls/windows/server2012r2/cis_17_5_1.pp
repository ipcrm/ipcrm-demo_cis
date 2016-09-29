class demo_cis::controls::windows::server2012r2::cis_17_5_1 {

  auditpol { 'Account Lockout':
    success => 'enable',
    failure => 'disable',
  }

}

