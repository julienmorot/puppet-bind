define ppbind::zone (
  $zone_source = '',
  $zone_name = '',
  $zone_type = '',
) {
  include '::ppbind::vars'
  file { "${::ppbind::vars::zonedir}/${zone_name}.conf":
    ensure  => file,
    owner   => $::ppbind::vars::zoneowner,
    group   => $::ppbind::vars::zonegroup,
    mode    => $::ppbind::vars::zonemode,
    source => $zone_source,
    notify => Service['bind9']
  }
}

