# Class: bind
# ===========================
#
# Full description of class bind here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream bind servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_bind_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'bind':
#      servers => [ 'pool.bind.org', 'bind.local.company.com' ],
#    }
#
# Authors
# -------
#
# Julien Morot>
#
# Copyright
# ---------
#
# Copyright 2018 Julien Morot.
#
class bind {
  include bind::install
  include bind::service
  include '::bind::vars'
  concat { $::bind::vars::zonesfile:
    owner   => $::bind::vars::zoneowner,
    group   => $::bind::vars::zonegroup,
    mode    => $::bind::vars::zonemode,
    ensure  => 'present',
    notify  => Service['bind9'],
  }
}

