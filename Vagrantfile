# Vagrantfile (vagrant) for the Splunk App for Chef: Bistro.
#
# For use with the Bistro App test suite.
#
# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Source:: https://github.com/ampledata/bistro
# Author:: Greg Albrecht <mailto:gba@splunk.com>
# Copyright:: Copyright 2012 Splunk, Inc.
# License:: Apache License 2.0
#


Vagrant::Config.run do |config|
  config.vm.box = 'stormbase_100'
  # Splunk Storm AMI v100: 64bit Ubuntu 10.04.4
  config.vm.box_url = 'https://dl.dropbox.com/u/4036736/stormbase_100.box'
  config.vm.host_name = 'bistro'
  config.vm.forward_port 8000, 5190
  config.vm.forward_port 8089, 5199
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks', 'site-cookbooks']
    chef.roles_path = 'roles'
    chef.add_role('bistro')
  end
end
