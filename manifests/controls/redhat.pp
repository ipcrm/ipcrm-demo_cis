class demo_cis::controls::redhat {
  case $::operatingsystemmajrelease {
    '7': {
          include ::demo_cis::controls::redhat::seven::cis_helpers
          include ::demo_cis::controls::redhat::seven::cis_1_1_1_1
          include ::demo_cis::controls::redhat::seven::cis_1_1_1_2
          include ::demo_cis::controls::redhat::seven::cis_1_1_1_3
          include ::demo_cis::controls::redhat::seven::cis_1_1_1_4
          include ::demo_cis::controls::redhat::seven::cis_1_1_1_5
          include ::demo_cis::controls::redhat::seven::cis_1_1_1_6
          include ::demo_cis::controls::redhat::seven::cis_1_1_1_7
          include ::demo_cis::controls::redhat::seven::cis_1_1_1_8
          include ::demo_cis::controls::redhat::seven::cis_1_5_1
          include ::demo_cis::controls::redhat::seven::cis_1_5_3
          include ::demo_cis::controls::redhat::seven::cis_1_5_4
          include ::demo_cis::controls::redhat::seven::cis_1_7_1_1
          include ::demo_cis::controls::redhat::seven::cis_1_7_1_2
          include ::demo_cis::controls::redhat::seven::cis_1_7_1_3
          include ::demo_cis::controls::redhat::seven::cis_1_7_1_4
          include ::demo_cis::controls::redhat::seven::cis_1_7_1_5
          include ::demo_cis::controls::redhat::seven::cis_1_7_1_6
          include ::demo_cis::controls::redhat::seven::cis_5_2
    }
    default: {}
  }
}
