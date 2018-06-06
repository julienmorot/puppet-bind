class bind::service inherits bind {

  service { 'bind9':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => Package['bind9'],
  }

}
