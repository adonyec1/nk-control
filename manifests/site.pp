## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.


node 'adonyec3.mylabserver' {
 notify { 'This matches the node name': }
# class { 'java': }
# include ntp
}

node /^adonyec3/ {
  notify { " This is a node definition using regex !!!!!!": }
}

#node default {
#  $top_scope = "Node top scope"
#  notify { "$top_scope": 
#    message => "This is a top scope variable: ${top_scope}"
#  }
#notify { "This is the default node!!!!": }
#  class { 'java': }
# class { 'ntp': }
#}

node default {
 # This is where you can declare classes for all
}

node 'adonyec1.mylabserver.com' {
  include pe_repo::platform::el_6_x86_64
  include pe_repo::platform::ubuntu_1204_amd64
}
