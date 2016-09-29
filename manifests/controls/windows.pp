class demo_cis::controls::windows {
  case $::operatingsystemmajrelease {
    '2012 R2': {
      include ::demo_cis::controls::windows::server2012r2::cis_helpers
      include ::demo_cis::controls::windows::server2012r2::cis_1_1_1
      include ::demo_cis::controls::windows::server2012r2::cis_1_1_2
      include ::demo_cis::controls::windows::server2012r2::cis_1_1_3
      include ::demo_cis::controls::windows::server2012r2::cis_1_1_4
      include ::demo_cis::controls::windows::server2012r2::cis_1_1_5
      include ::demo_cis::controls::windows::server2012r2::cis_1_1_6
      include ::demo_cis::controls::windows::server2012r2::cis_9_1_1
      include ::demo_cis::controls::windows::server2012r2::cis_9_2_1
      include ::demo_cis::controls::windows::server2012r2::cis_9_3_1
      include ::demo_cis::controls::windows::server2012r2::cis_17_1_1
      include ::demo_cis::controls::windows::server2012r2::cis_17_2_1
      include ::demo_cis::controls::windows::server2012r2::cis_17_3_1
      include ::demo_cis::controls::windows::server2012r2::cis_17_4_1
      include ::demo_cis::controls::windows::server2012r2::cis_17_5_1
    }
    default: {}
  }
}
