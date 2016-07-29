class demo_cis::controls::redhat::seven::cis_1_1_1_7 (
  $enable = true,
){
  if $enable == true {
    file{'cis_1_1_1_7':
      ensure  => present,
      path    => '/etc/modprobe.d/cis_1_1_1_7.conf',
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => 'install udf /bin/true',
    }
  }
}
