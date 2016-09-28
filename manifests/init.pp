class demo_cis {
  case $::osfamily {
    'RedHat': {
      include ::demo_cis::controls::redhat
    }
    'Windows': {
      include ::demo_cis::controls::windows
    }
    default: {}
  }
}
