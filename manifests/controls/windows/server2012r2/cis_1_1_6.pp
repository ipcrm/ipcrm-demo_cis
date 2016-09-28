class demo_cis::controls::windows::server2012r2::cis_1_1_6 {

  local_security_policy{ 'Store passwords using reversible encryption':
    ensure       => present,
    policy_value => '0',
  }

}
