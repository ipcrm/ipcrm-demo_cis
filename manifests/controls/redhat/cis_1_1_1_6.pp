class demo_cis::controls::redhat::c_1_1_1_6 (
  $enable = true,
){
  if $enable == true {
    file{'cis_1_1_1_6':
      path    => '/etc/modprobe.d/cis_1_1_1_6.conf',
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => 'install squashfs /bin/true',
    }
  }
}
