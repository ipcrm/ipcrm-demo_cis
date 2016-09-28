class demo_cis::windows::server2012r2::cis_1_1_5 {

  local_security_polcy{ 'Password must meet complexity requirements':
    ensure       => present,
    policy_value => '1',
  }

}
