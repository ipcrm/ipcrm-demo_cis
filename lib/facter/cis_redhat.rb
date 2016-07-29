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
      'fail'
    else
      'pass'
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
      'fail'
    else
      'pass'
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
      'fail'
    else
      'pass'
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
      'fail'
    else
      'pass'
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
      'fail'
    else
      'pass'
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
      'fail'
    else
      'pass'
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
      'fail'
    else
      'pass'
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
      'fail'
    else
      'pass'
    end
  end
end
