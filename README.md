# bind

## Description

Module to configure Bind, only tested with Debian/Ubuntu.

## Setup

### Beginning with bind

The very basic steps needed for a user to get the module up and running. This
can include setup steps, if necessary, or it can be an example of the most
basic use of the module.

## Usage

Just include bind and your configuration in the node definition.
Example :
```
	node 'master' {
	  include bind
	  bind::namedconf { '/etc/bind/named.conf':
	    forwarders        => [ '8.8.8.8', '8.8.4.4' ],
   	    listen_on    => [ '127.0.0.1', '192.168.100.10' ],
	    listen_on_v6 => ['::1'],
	  }


      bind::zone { 'int.foobar.tld':
        zone_name       => 'int.foobar.tld',
        zone_type       => 'master',
        zone_source     => 'puppet:///modules/bind/db.int.foobar.tld',
      }
	}
```

## Limitations

No views, ACL or master/slave. I'll add these features later.
Only masters zone but if all your DNS are managed with puppet, it's not a problem :)

