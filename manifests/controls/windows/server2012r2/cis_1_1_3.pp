class demo_cis::controls::windows::server2012r2::cis_1_1_3 {

  local_security_policy{ 'Minimum password age':
    ensure       => present,
    policy_value => '1',
  }

}
