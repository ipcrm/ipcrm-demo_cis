class demo_cis::controls::redhat::seven::cis_helpers {
  exec {'cis_sysctl':
    path        => $::path,
    command     => 'sysctl -p',
    refreshonly => true,
  }
}

