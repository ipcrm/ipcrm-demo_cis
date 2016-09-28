class demo_cis::windows::server2012r2::cis_9_1_1 {
  $key = 'SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile'
  if ! defined(Registry_key[$key]){
    registry_key{ $key:
      ensure => present,
    }
  }

  registry_value { "${key}/EnableFirewall":
    ensure  => present,
    type    => 'dword',
    value   => 1,
    require => Registry_key[$key],
  }

}
