class ppbind::install inherits ppbind {
  package { 'dnsutils': ensure => installed }
  package { 'bind9': ensure => installed }
  package { 'bind9utils': ensure => installed }
}


