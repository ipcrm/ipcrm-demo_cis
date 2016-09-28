class demo_cis::controls::windows::server2012r2::cis_1_1_4 {

  local_security_policy{ 'Minimum password length':
    ensure       => present,
    policy_value => '14',
  }

}
