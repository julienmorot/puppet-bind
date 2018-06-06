define bind::namedconf (
  $forwarders             = [],
  $version                = ['none'],
  $listen_on              = [ 'any' ],
  $listen_on_v6           = [ 'any' ],
  $allow_query            = [ 'localhost' ],
  $recursion              = 'yes',
  $allow_recursion        = [],
  $allow_transfer         = [],
  $check_names            = [],
  $extra_options          = {},
  $zones                  = {},
) {

  file { '/etc/bind/named.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'bind',
    mode    => '0644',
    content => template("${module_name}/named.conf.erb"),
    notify => Service['bind9']
  }
  file { '/etc/bind/named.conf.options':
    ensure  => file,
    owner   => 'root',
    group   => 'bind',
    mode    => '0644',
    content => template("${module_name}/named.conf.options.erb"),
    notify => Service['bind9']
  }
}

