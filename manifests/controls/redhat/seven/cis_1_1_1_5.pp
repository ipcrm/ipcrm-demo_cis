class demo_cis::controls::redhat::seven::cis_1_1_1_5 (
  $enable = true,
){
  if $enable == true {
    file{'cis_1_1_1_5':
      ensure  => present,
      path    => '/etc/modprobe.d/cis_1_1_1_5.conf',
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => 'install hfsplus /bin/true',
    }
  }
}
