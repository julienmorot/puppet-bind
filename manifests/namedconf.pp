define ppbind::namedconf (
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
  $keys                   = {},
  $includes               = [],
  $views                  = {},
) {

  file { '/etc/bind/named.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'bind',
    mode    => '0644',
    content => template("${module_name}/named.conf.erb"),
  }
  file { '/etc/bind/named.conf.local':
    ensure  => file,
    owner   => 'root',
    group   => 'bind',
    mode    => '0644',
    content => template("${module_name}/named.conf.local.erb"),
  }
  file { '/etc/bind/named.conf.options':
    ensure  => file,
    owner   => 'root',
    group   => 'bind',
    mode    => '0644',
    content => template("${module_name}/named.conf.options.erb"),
  }
}
