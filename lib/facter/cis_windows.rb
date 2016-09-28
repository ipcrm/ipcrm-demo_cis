# Helpers
def secpol_search(pattern,polvalue,policies)
  sec_key = policies.keys.grep(/#{pattern}/)[0]
  if not sec_key.nil?
    if policies[sec_key] == polvalue
      :pass
    else
      :fail
    end
  else
    :fail
  end
end

def scan_reg(regkey,path,reqvalue)
  require 'win32/registry'
  begin
    Win32::Registry::HKEY_LOCAL_MACHINE.open(regkey, Win32::Registry::KEY_READ) do |reg|
      if reg['EnableFirewall'] == reqvalue
        :pass
      else
        :fail
      end
    end
  rescue
      :fail
  end
end


# Get current security policy
sechash = Hash.new
if Facter.value('osfamily') == 'windows' and Facter.value('operatingsystemmajrelease') == '2012 R2'

    Facter::Core::Execution.exec('secedit /export /cfg C:\secedit.ini')
    File.open('C:\secedit.ini', "rb:UTF-16LE") do |f|
      f.each_line do |line|
        if line.encode!('utf-8').match(/\=/)
          key,value=line.split(/[\s]?=[\s]?/)
          sechash[key.chomp.gsub(/\\/,'')] = value.chomp
        end
      end
    end

end

Facter.add(:cis_1_1_1) do
  confine :osfamily => 'windows'
  confine :operatingsystemmajrelease => '2012 R2'
  setcode do
    secpol_search('PasswordHistorySize','24',sechash)
  end
end

Facter.add(:cis_1_1_2) do
  confine :osfamily => 'windows'
  confine :operatingsystemmajrelease => '2012 R2'
  setcode do
    secpol_search('MaximumPasswordAge','60',sechash)
  end
end

Facter.add(:cis_1_1_3) do
  confine :osfamily => 'windows'
  confine :operatingsystemmajrelease => '2012 R2'
  setcode do
    secpol_search('MinimumPasswordAge','1',sechash)
  end
end

Facter.add(:cis_1_1_4) do
  confine :osfamily => 'windows'
  confine :operatingsystemmajrelease => '2012 R2'
  setcode do
    secpol_search('MinimumPasswordLength','14',sechash)
  end
end

Facter.add(:cis_1_1_5) do
  confine :osfamily => 'windows'
  confine :operatingsystemmajrelease => '2012 R2'
  setcode do
    secpol_search('PasswordComplexity','1',sechash)
  end
end

Facter.add(:cis_1_1_6) do
  confine :osfamily => 'windows'
  confine :operatingsystemmajrelease => '2012 R2'
  setcode do
    secpol_search('ClearTextPassword','1',sechash)
  end
end

Facter.add(:cis_9_1_1) do
  confine :osfamily => 'windows'
  confine :operatingsystemmajrelease => '2012 R2'
  setcode do
    regkey = 'SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile'
    scan_reg(regkey,'EnableFirewall',1)
  end
end


