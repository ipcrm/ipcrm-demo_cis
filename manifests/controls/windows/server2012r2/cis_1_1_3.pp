class demo_cis::windows::server2012r2::cis_1_1_3 {

  local_security_polcy{ 'Minimum password age':
    ensure       => present,
    policy_value => '1',
  }

}
