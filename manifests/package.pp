# @summary
#   This class handles metricbeat package.
#
# @api private
#
class metricbeat::package {
  package { $metricbeat::package_name:
    ensure   => $metricbeat::package_ensure,
    provider => $metricbeat::package_provider,
    source   => $metricbeat::package_source,
  }
}
