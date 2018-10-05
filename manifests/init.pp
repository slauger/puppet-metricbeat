# metricbeat
#
# @summary
#  Main class, includes all other classes
#
# @param package_name
#   Name of the metricbeat package. Dfault value: 'metricbeat'.
#
# @param package_ensure
#   State of package (e.g. present oder latest). Default value: 'present'.
#
# @param package_provider
#   Optional package provider for the package. Default value: Undef.
#
# @param package_source
#   Optional package source for the package. Default value: Undef.
#
# @param service_name
#   Name of the metricbeat service. Default value: 'metricbeat'.
#
# @param service_ensure
#   Whether the metricbeat service should be running. Default value: 'running'.
#
# @param service_enable
#   Whether the metricbeat service should be enabled. Default value: true.
#
# @param environment_file
#   Path to the environment file for systemd. Default value: '/etc/sysconfig/metricbeat'.
#
# @param modules
#   An hash with enabled modules for metricbeat. Default value: {}.
#
# @param config
#   An hash with the main and output configuration. Default value: {}.
#
# @param env
#   An array with environment variables, wich will be written to the environment_file. Default value: [].
class metricbeat(
  String $package_name,
  String $package_ensure,
  Optional[String] $package_provider,
  Optional[String] $package_source,
  String $service_name,
  Optional[String] $service_ensure,
  Optional[Boolean] $service_enable,
  String $environment_file,
  Optional[Hash] $modules,
  Optional[Hash] $config,
  Optional[Hash] $env,
) {
  contain 'metricbeat::package'
  contain 'metricbeat::config'
  contain 'metricbeat::service'

  Class['metricbeat::package']
  ->Class['metricbeat::config']
  ~>Class['metricbeat::service']
}
