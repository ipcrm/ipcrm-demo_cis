class demo_cis::controls::redhat::seven::cis_1_5_1 (
  $enable = true
){
  if $enable == true {

    file_line {'cis_1_5_1_limits.conf':
      path => '/etc/security/limits.conf',
      line => '* hard core 0',
    }

    file_line {'cis_1_5_1_sysctl.conf':
      path   => '/etc/sysctl.conf',
      line   => 'fs.suid_dumpable = 0',
      notify => Exec['cis_sysctl'],
    }

  }

}

