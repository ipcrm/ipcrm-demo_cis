class demo_cis::controls::redhat::seven::cis_1_7_1_1 (
  $enable = true
){
  if $enable == true {
    if !defined(File['/etc/motd']) {
      file {'cis_1_7_1_1_motd':
        ensure  => present,
        path    => '/etc/motd',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => 'Authorized uses only. All activity may be monitored and reported.',
      }
    }
  }

}

