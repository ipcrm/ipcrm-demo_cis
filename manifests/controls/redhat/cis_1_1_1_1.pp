class demo_cis::controls::redhat::c_1_1_1_1 (
  $enable = true,
){
  if $enable == true {
    file{'cis_1_1_1_1':
      path    => '/etc/modprobe.d/cis_1_1_1_1.conf',
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => 'install cramfs /bin/true',
    }
  }
}
