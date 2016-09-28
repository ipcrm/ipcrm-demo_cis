class demo_cis::controls::windows::server2012r2::cis_1_1_1 {

  local_security_policy{ 'Enforce password history':
    ensure       => present,
    policy_value => '24',
  }

}
