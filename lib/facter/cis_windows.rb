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

def scan_reg(regkey,value,reqvalue)
  require 'win32/registry'
  begin
    Win32::Registry::HKEY_LOCAL_MACHINE.open(regkey, Win32::Registry::KEY_READ) do |reg|
      if reg[value] == reqvalue
        :pass
      else
        :fail
      end
    end
  rescue
      :fail
  end
end

def audit_pol(settings,subcategory,success,failure)
  if settings[subcategory][:success] == success \
  and settings[subcategory][:failure] == failure
    :pass
  else
    :fail
  end
end

# Get current security policy
sechash = Hash.new
audithash = Hash.new
if Facter.value('osfamily') == 'windows' and Facter.value('operatingsystemmajrelease') == '2012 R2'

    # Setup Secedit hash
    Facter::Core::Execution.exec('secedit /export /cfg C:\secedit.ini')
    File.open('C:\secedit.ini', "rb:UTF-16LE") do |f|
      f.each_line do |line|
        if line.encode!('utf-8').match(/\=/)
          key,value=line.split(/[\s]?=[\s]?/)

          unless value.nil? or key.nil?
            sechash[key.chomp.gsub(/\\/,'')] = value.chomp
          end

        end
      end
    end

    # Setup Auditpol Hash
    # https://github.com/jonono/puppet-auditpol/blob/master/lib/puppet/provider/auditpol/auditpol.rb
    # generate a list of all categories and subcategories in csv
    categories = Facter::Core::Execution.exec('auditpol /get /category:* /r')

    # the drop(1) drops the header line
    categories.split("\n").drop(1).collect do |line|

      line_array = line.split(',')
      subcategory_name = line_array[2]
      subcategory_policy = line_array[4]

      case subcategory_policy
      when 'Success'
        success = 'enable'
        failure = 'disable'
      when 'Failure'
        success = 'disable'
        failure = 'enable'
      when 'Success and Failure'
        success = 'enable'
        failure = 'enable'
      when 'No Auditing'
        success = 'disable'
        failure = 'disable'
      else # disable all if something weird happened I guess
        success = 'disable'
        failure = 'disable'
      end

      audithash[subcategory_name] = { :success => success, :failure => failure, }

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
    secpol_search('ClearTextPassword','0',sechash)
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

Facter.add(:cis_9_2_1) do
  confine :osfamily => 'windows'
  confine :operatingsystemmajrelease => '2012 R2'
  setcode do
    regkey = 'SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile'
    scan_reg(regkey,'EnableFirewall',1)
  end
end

Facter.add(:cis_9_3_1) do
  confine :osfamily => 'windows'
  confine :operatingsystemmajrelease => '2012 R2'
  setcode do
    regkey = 'SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile'
    scan_reg(regkey,'EnableFirewall',1)
  end
end

Facter.add(:cis_17_1_1) do
  confine :osfamily => 'windows'
  confine :operatingsystemmajrelease => '2012 R2'
  setcode do
    audit_pol(audithash,'Credential Validation','enable','enable')
  end
end

Facter.add(:cis_17_2_1) do
  confine :osfamily => 'windows'
  confine :operatingsystemmajrelease => '2012 R2'
  setcode do
    audit_pol(audithash,'Application Group Management','enable','enable')
  end
end

Facter.add(:cis_17_3_1) do
  confine :osfamily => 'windows'
  confine :operatingsystemmajrelease => '2012 R2'
  setcode do
    audit_pol(audithash,'Process Creation','enable','enable')
  end
end

Facter.add(:cis_17_4_1) do
  confine :osfamily => 'windows'
  confine :operatingsystemmajrelease => '2012 R2'
  setcode do
    audit_pol(audithash,'Directory Service Access','enable','enable')
  end
end

Facter.add(:cis_17_5_1) do
  confine :osfamily => 'windows'
  confine :operatingsystemmajrelease => '2012 R2'
  setcode do
    audit_pol(audithash,'Account Lockout','enable','disable')
  end
end
