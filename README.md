# DNS-Bind9

## Description

Ansible role to install and configure a DNS server using Bind9.
The node installed will act as a master or/and a slave, with/without forwarders.

[![Build Status](https://travis-ci.org/mrLarbi/DNS-Bind9.svg?branch=master)](https://travis-ci.org/mrLarbi/DNS-Bind9)

## Requirements

- Ansible 1.4+

## Dependencies

None.

## Installation

```
ansible-galaxy install mrlarbi.dns-bind
```

## Role Variables

# General

|Name|Default|Description|
|----|----|-------|
bind_hostname||The node hostname. Defined automatically if not set.
bind_domain_name|local|The node domain. Defined automatically if not set.

# Master

|Name|Default|Description|
|----|----|-------|
bind_is_master|yes| Is the node a master. 'yes' or 'no'.
bind_mail||The zone email. Defined automatically if not set (to $user.$domain).
bind_master_entries|| Zone entries. List of {"name":"something", "ip": "some ip"}.
bind_slave_hosts|| List of slaves (Allow transfer).
bind_notify|yes| 

# Slave

|Name|Default|Description|
|----|----|-------|
bind_is_slave|no| Is the node a slave. 'yes' or 'no'.
bind_master_host|| Master ip.

# Caching

|Name|Default|Description|
|----|----|-------|
bind_is_caching|yes| Is a caching node. 'yes' or 'no'
bind_first_forwarder|8.8.8.8| Ip of the first forwarder.
bind_second_forwarder|8.8.4.4| Ip of the second forwarder.

### Configuration example

Set up a master node :

      bind_hostname: "yoda"
      bind_domain_name: "jedi"
      bind_mail: "yoda.jedi"
      bind_is_master: yes
      bind_master_entries : [ {"name": "www", "ip":"127.0.0.1"} ]
      bind_slave_hosts: [ "192.168.1.3" ]
      bind_notify: yes

Set up a slave node :

      bind_hostname: "obi"
      bind_domain_name: "jedi"
      bind_mail: "obi.jedi"
      bind_is_slave: no
      bind_master_host: "192.168.1.2"
    
Set up a caching node :

      bind_hostname: "ani"
      bind_domain_name: "jedi"
      bind_mail: "ani.jedi"
      bind_is_caching: yes
      bind_first_forwarder: 8.8.8.8
      bind_second_forwarder: 8.8.4.4
    
## Example

    - hosts: host
      roles:
         - { role: mrlarbi.dns-bind }

# License

GNU General Public License (GPL) V3
