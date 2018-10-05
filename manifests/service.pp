# @summary
#   This class handles the metricbeat service.
#
# @api private
#
class metricbeat::service {
  service{ $metricbeat::service_name:
    ensure => $metricbeat::service_ensure,
    enable => $metricbeat::service_enable,
  }
}
