# Helpers
def f_search (f,pattern)
  f.each do |line|
    if line.match(/#{pattern}/) && !line.match(/#/)
      return :pass
    end
  end
  return :fail
end


Facter.add(:cis_1_1_1_1) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    s = Facter::Core::Execution.exec(
      '/sbin/modprobe -n -v cramfs|grep "install /bin/true"'
    )
    t = Facter::Core::Execution.exec(
      '/sbin/lsmod |grep cramfs'
    )
    if ( s != 'install /bin/true' or t != '' )
      :fail
    else
      :pass
    end
  end
end

Facter.add(:cis_1_1_1_2) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    s = Facter::Core::Execution.exec(
      '/sbin/modprobe -n -v freevxfs|grep "install /bin/true"'
    )
    t = Facter::Core::Execution.exec(
      '/sbin/lsmod |grep freevxfs'
    )
    if ( s != 'install /bin/true' or t != '' )
      :fail
    else
      :pass
    end
  end
end

Facter.add(:cis_1_1_1_3) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    s = Facter::Core::Execution.exec(
      '/sbin/modprobe -n -v jffs2|grep "install /bin/true"'
    )
    t = Facter::Core::Execution.exec(
      '/sbin/lsmod |grep jjfs2'
    )
    if ( s != 'install /bin/true' or t != '' )
      :fail
    else
      :pass
    end
  end
end

Facter.add(:cis_1_1_1_4) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    s = Facter::Core::Execution.exec(
      '/sbin/modprobe -n -v hfs|grep "install /bin/true"'
    )
    t = Facter::Core::Execution.exec(
      '/sbin/lsmod |grep hfs'
    )
    if ( s != 'install /bin/true' or t != '' )
      :fail
    else
      :pass
    end
  end
end

Facter.add(:cis_1_1_1_5) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    s = Facter::Core::Execution.exec(
      '/sbin/modprobe -n -v hfsplus|grep "install /bin/true"'
    )
    t = Facter::Core::Execution.exec(
      '/sbin/lsmod |grep hfsplus'
    )
    if ( s != 'install /bin/true' or t != '' )
      :fail
    else
      :pass
    end
  end
end

Facter.add(:cis_1_1_1_6) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    s = Facter::Core::Execution.exec(
      '/sbin/modprobe -n -v squashfs|grep "install /bin/true"'
    )
    t = Facter::Core::Execution.exec(
      '/sbin/lsmod |grep squashfs'
    )
    if ( s != 'install /bin/true' or t != '' )
      :fail
    else
      :pass
    end
  end
end

Facter.add(:cis_1_1_1_7) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    s = Facter::Core::Execution.exec(
      '/sbin/modprobe -n -v udf|grep "install /bin/true"'
    )
    t = Facter::Core::Execution.exec(
      '/sbin/lsmod |grep udf'
    )
    if ( s != 'install /bin/true' or t != '' )
      :fail
    else
      :pass
    end
  end
end


Facter.add(:cis_1_1_1_8) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    s = Facter::Core::Execution.exec(
      '/sbin/modprobe -n -v vfat|grep "install /bin/true"'
    )
    t = Facter::Core::Execution.exec(
      '/sbin/lsmod |grep vfat'
    )
    if ( s != 'install /bin/true' or t != '' )
      :fail
    else
      :pass
    end
  end
end

Facter.add(:cis_1_5_1) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    s = Facter::Core::Execution.exec(
      '/bin/grep "hard core" /etc/security/limits.conf'
    )
    t = Facter::Core::Execution.exec(
      '/sbin/sysctl fs.suid_dumpable'
    )
    if ( ! s.match(/\* hard core 0/) or t != 'fs.suid_dumpable = 0' )
      :fail
    else
      :pass
    end
  end
end


Facter.add(:cis_1_5_3) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    s = Facter::Core::Execution.exec(
      '/sbin/sysctl kernel.randomize_va_space'
    )
    if ( s != 'kernel.randomize_va_space = 2' )
      :fail
    else
      :pass
    end
  end
end

Facter.add(:cis_1_5_4) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    s = Facter::Core::Execution.exec(
      '/bin/rpm -q prelink|grep "not installed"'
    )
    if ( s == '' )
      :fail
    else
      :pass
    end
  end
end

Facter.add(:cis_1_7_1_1) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    s = Facter::Core::Execution.exec(
      'egrep \'(\\\\v|\\\\r|\\\\m|\\\\s)\' /etc/motd|wc -l'
    )
    if ( s.to_i > 0 )
      :fail
    else
      :pass
    end
  end
end

Facter.add(:cis_1_7_1_2) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    s = Facter::Core::Execution.exec(
      'egrep \'(\\\\v|\\\\r|\\\\m|\\\\s)\' /etc/issue|wc -l'
    )
    if ( s.to_i > 0 )
      :fail
    else
      :pass
    end
  end
end

Facter.add(:cis_1_7_1_3) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    s = Facter::Core::Execution.exec(
      'egrep \'(\\\\v|\\\\r|\\\\m|\\\\s)\' /etc/issue.net|wc -l'
    )
    if ( s.to_i > 0 )
      :fail
    else
      :pass
    end
  end
end

Facter.add(:cis_1_7_1_4) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f = File.stat("/etc/motd")
    mode = "%04o" % f.mode
    if ( mode == '100644' and f.uid == 0 and f.gid == 0 )
      :pass
    else
      :fail
    end
  end
end

Facter.add(:cis_1_7_1_5) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f = File.stat("/etc/issue")
    mode = "%04o" % f.mode
    if ( mode == '100644' and f.uid == 0 and f.gid == 0 )
      :pass
    else
      :fail
    end
  end
end

Facter.add(:cis_1_7_1_6) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f = File.stat("/etc/issue.net")
    mode = "%04o" % f.mode
    if ( mode == '100644' and f.uid == 0 and f.gid == 0 )
      :pass
    else
      :fail
    end
  end
end

Facter.add(:cis_5_2_1) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f = File.stat("/etc/ssh/sshd_config")
    mode = "%04o" % f.mode
    if ( mode == '100600' and f.uid == 0 and f.gid == 0 )
      :pass
    else
      :fail
    end
  end
end

# Go pick up the contents of sshd_config for some checks
sshd_config = '/etc/ssh/sshd_config'
f = Array.new
if File.file?(sshd_config)
  f = File.readlines('/etc/ssh/sshd_config')
end

Facter.add(:cis_5_2_2) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f_search(f,'Protocol 2')
  end
end


Facter.add(:cis_5_2_3) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f_search(f,'LogLevel INFO')
  end
end

Facter.add(:cis_5_2_4) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f_search(f,'X11Forwarding no')
  end
end

Facter.add(:cis_5_2_5) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f_search(f,'MaxAuthTries 4')
  end
end

Facter.add(:cis_5_2_6) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f_search(f,'IgnoreRhosts yes')
  end
end

Facter.add(:cis_5_2_7) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f_search(f,'HostbasedAuthentication no')
  end
end

Facter.add(:cis_5_2_8) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f_search(f,'PermitRootLogin no')
  end
end


Facter.add(:cis_5_2_9) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f_search(f,'PermitEmptyPasswords no')
  end
end

Facter.add(:cis_5_2_10) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f_search(f,'PermitUserEnvironment no')
  end
end

Facter.add(:cis_5_2_11) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f_search(f,'Ciphers aes256-ctr,aes192-ctr,aes128-ctr')
  end
end

Facter.add(:cis_5_2_12) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f_search(f,'MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com')
  end
end

Facter.add(:cis_5_2_13) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    alive_interval = f_search(f,'ClientAliveInterval 300')
    alive_count = f_search(f,'ClientAliveCountMax 0')
    if alive_interval == :pass && alive_count == :pass
      :pass
    else
      :fail
    end
  end
end

Facter.add(:cis_5_2_14) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    f_search(f,'LoginGraceTime 60')
  end
end

Facter.add(:cis_5_2_15) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'
  setcode do
    users  = f_search(f,'AllowUsers')
    groups = f_search(f,'AllowGroups')
    if users == :pass || groups == :pass
      :pass
    else
      :fail
    end
  end
end
