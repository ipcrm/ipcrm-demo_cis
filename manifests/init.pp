class demo_cis {
  case $::osfamily {
    'RedHat': {
      include ::demo_cis::controls::redhat
    }
    default: {}
  }
}
