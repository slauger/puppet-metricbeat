# @summary
#   This class handles the configuration file.
#
# @api private
#
class metricbeat::config {
  file { '/etc/metricbeat':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  ->file { ['/etc/metricbeat/modules.d']:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    recurse => true,
    purge   => true,
    ignore  => ['*.yml.disabled'],
  }
  ->file { '/etc/metricbeat/metricbeat.yml':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp("${module_name}/etc/metricbeat/metricbeat.yml.epp", {
      'config' => delete(to_yaml($metricbeat::config), "---\n"),
    }),
  }

  file { $metricbeat::environment_file:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp("${module_name}/environment_file.epp"),
  }

  $metricbeat::modules.each |String $filename, Array $module_config| {
    metricbeat::module{ $filename:
      config => $module_config,
    }
  }
}
