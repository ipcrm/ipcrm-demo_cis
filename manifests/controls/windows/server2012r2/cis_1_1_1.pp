class demo_cis::windows::server2012r2::cis_1_1_1 {

  local_security_polcy{ 'Enforce password history':
    ensure       => present,
    policy_value => '24',
  }

}
