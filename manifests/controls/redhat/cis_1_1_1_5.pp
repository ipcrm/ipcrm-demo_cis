class demo_cis::controls::redhat::c_1_1_1_5 (
  $enable = true,
){
  if $enable == true {
    file{'cis_1_1_1_5':
      path    => '/etc/modprobe.d/cis_1_1_1_5.conf',
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => 'install hfsplus /bin/true',
    }
  }
}
