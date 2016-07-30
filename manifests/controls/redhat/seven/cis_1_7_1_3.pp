class demo_cis::controls::redhat::seven::cis_1_7_1_3 (
  $enable = true
){
  if $enable == true {
    file {'cis_1_7_1_3_issue.net':
      ensure  => present,
      path    => '/etc/issue.net',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => 'Authorized uses only. All activity may be monitored and reported.',
    }
  }

}

