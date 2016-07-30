class demo_cis::controls::redhat::seven::cis_5_2 (
  $enable = true
){
  if $enable == true {
    class {'::ssh':
      ssh_config_owner                  => 'root',
      ssh_config_group                  => 'root',
      ssh_config_mode                   => '0600',
      sshd_config_loglevel              => 'INFO',
      sshd_x11_forwarding               => 'no',
      sshd_config_maxauthtries          => 4,
      sshd_ignorerhosts                 => 'yes',
      sshd_hostbasedauthentication      => 'no',
      permit_root_login                 => 'no',
      sshd_config_permitemptypasswords  => 'no',
      sshd_config_permituserenvironment => 'no',
      sshd_config_ciphers               => ['aes256-ctr','aes192-ctr','aes128-ctr'],
      sshd_config_macs                  => [
          'hmac-sha2-512-etm@openssh.com',
          'hmac-sha2-256-etm@openssh.com',
          'umac-128-etm@openssh.com',
          'hmac-sha2-512',
          'hmac-sha2-256',
          'umac-128@openssh.com',
      ],
      sshd_client_alive_interval        => '300',
      sshd_client_alive_count_max       => '0',
      sshd_config_login_grace_time      => '60',
      sshd_config_allowgroups           => ['wheel'],
      sshd_config_banner                => '/etc/issue.net',
    }
  }
}

