require 'puppet'
Facter.add(:metricbeat_version) do
  setcode do
    if Facter::Util::Resolution.which('metricbeat')
      metricbeat_version = Facter::Util::Resolution.exec('metricbeat version 2>&1')
      %r{^metricbeat version ([\w\.]+)}.match(metricbeat_version)[1]
    elsif Facter::Util::Resolution.which('rpm')
      Facter::Util::Resolution.exec('rpm -q metricbeat --qf \'%{VERSION}\'')
    elsif Facter::Util::Resolution.which('dpkg-query')
      Facter::Util::Resolution.exec('dpkg-query -W -f=\'${Version}\n\' metricbeat')
    end
  end
end
