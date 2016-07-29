class demo_cis::controls::redhat::seven::cis_1_1_1_4 (
  $enable = true,
){
  if $enable == true {
    file{'cis_1_1_1_4':
      ensure  => present,
      path    => '/etc/modprobe.d/cis_1_1_1_4.conf',
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => 'install hfs /bin/true',
    }
  }
}
