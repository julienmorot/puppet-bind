class ppbind::service inherits ppbind {

  service { 'bind9':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => Package['bind9'],
  }

}
