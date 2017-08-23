class demo_cis::controls::redhat::seven::cis_5_2 (
  $enable = true
){
  if $enable == true {
    class {'::ssh::server':
      syslog_level           => 'INFO',
      x11_forwarding         => 'no',
      max_auth_retries       => 4,
      permit_root_login      => 'no',
      ciphers                => ['aes256-ctr','aes192-ctr','aes128-ctr'],
      macs                   => [
          'hmac-sha2-512-etm@openssh.com',
          'hmac-sha2-256-etm@openssh.com',
          'umac-128-etm@openssh.com',
          'hmac-sha2-512',
          'hmac-sha2-256',
          'umac-128@openssh.com',
      ],
      client_alive_interval  => '300',
      client_alive_count_max => '0',
      config_allowed_groups  => ['wheel'],
      banner_file            => '/etc/issue.net',
    }
  }
}

