define bind::zone (
  $zone_source = '',
  $zone_name = '',
  $zone_type = '',
) {
  include '::bind::vars'
  file { "${::bind::vars::zonedir}/${zone_name}.conf":
    ensure  => file,
    owner   => $::bind::vars::zoneowner,
    group   => $::bind::vars::zonegroup,
    mode    => $::bind::vars::zonemode,
    source  => $zone_source,
    notify  => Service['bind9']
  }

  concat::fragment { $zone_name:
    target  => $::bind::vars::zonesfile,
    content => template("${module_name}/zone.erb"),    
  }
}

