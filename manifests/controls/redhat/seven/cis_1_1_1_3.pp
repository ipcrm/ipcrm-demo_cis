class demo_cis::controls::redhat::seven::cis_1_1_1_3 (
  $enable = true,
){
  if $enable == true {
    file{'cis_1_1_1_3':
      ensure  => present,
      path    => '/etc/modprobe.d/cis_1_1_1_3.conf',
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => 'install jffs2 /bin/true',
    }
  }
}
