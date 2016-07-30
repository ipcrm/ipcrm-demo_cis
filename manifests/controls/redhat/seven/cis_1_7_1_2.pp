class demo_cis::controls::redhat::seven::cis_1_7_1_2 (
  $enable = true
){
  if $enable == true {
    file {'cis_1_7_1_2_issue':
      ensure  => present,
      path    => '/etc/issue',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => 'Authorized uses only. All activity may be monitored and reported.',
    }
  }

}

