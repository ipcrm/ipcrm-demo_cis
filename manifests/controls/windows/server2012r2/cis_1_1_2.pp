class demo_cis::controls::windows::server2012r2::cis_1_1_2 {

  local_security_policy{ 'Maximum password age':
    ensure       => present,
    policy_value => '60',
  }

}
