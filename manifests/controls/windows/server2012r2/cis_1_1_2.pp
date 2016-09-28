class demo_cis::windows::server2012r2::cis_1_1_2 {

  local_security_polcy{ 'Maximum password age':
    ensure       => present,
    policy_value => '60',
  }

}
