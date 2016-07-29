class demo_cis::controls::redhat::seven::cis_1_1_1_8 (
  $enable = true,
){
  if $enable == true {
    file{'cis_1_1_1_8':
      ensure  => present,
      path    => '/etc/modprobe.d/cis_1_1_1_8.conf',
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => 'install vfat /bin/true',
    }
  }
}
