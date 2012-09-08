# Chef Role for the Splunk App for Chef: Bistro.
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


name 'bistro'

description 'Role for the Bistro App test suite.'

run_list(
  'recipe[splunk]',
  'recipe[chef_handler]',
  'recipe[bistro]',
  'recipe[splunk_handler]'
)
