class bind::install inherits bind {
  package { 'dnsutils': ensure => installed }
  package { 'bind9': ensure => installed }
  package { 'bind9utils': ensure => installed }
}


