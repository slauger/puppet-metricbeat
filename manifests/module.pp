# @summary
#   This defined type creates a new metricbeat module.
#
# @param config
#   An array with module configurations.
define metricbeat::module(
  Array $config,
) {
  file { "/etc/metricbeat/modules.d/${name}.yml":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => to_yaml($config),
  }
}
