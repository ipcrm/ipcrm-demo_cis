class demo_cis::controls::windows {
  case $::operatingsystemmajrelease {
    '2012 R2': {
      include ::demo_cis::controls::windows::server2012r2::cis_1_1_1
    }
    default: {}
  }
}
