# Makefile for the Splunk App for Chef: Bistro.
#
#
# Source:: https://github.com/ampledata/bistro
# Author:: Greg Albrecht <mailto:gba@splunk.com>
# Copyright:: Copyright 2012 Splunk, Inc.
# License:: Apache License 2.0
#


## Initialization
init: install_gems librarian_update

install_gems:
	gem install bundler
	bundle install

librarian_update:
	librarian-chef update


## Vagrant
vagrant: vagrant_up

vagrant_up:
	vagrant up

provision: vagrant_provision

vagrant_provision:
	vagrant provision

vagrant_destroy:
	vagrant destroy


## App

build:
	tar -X .tar_exclude -zcpf bistro.spl ../bistro

install_app:
	vagrant ssh -c 'sudo /opt/splunk/bin/splunk install app /vagrant/bistro.spl -update true -auth admin:changeme'

nuke_app:
	vagrant ssh -c 'sudo rm -rf /opt/splunk/etc/apps/bistro;sudo /opt/splunk/bin/splunk restart'


## Splunk

set_splunk_password:
	vagrant ssh -c "sudo /opt/splunk/bin/splunk edit user admin -password ampledata -auth admin:changeme"

sync:
	vagrant ssh -c 'sudo rsync -va /opt/splunk/etc/apps/bistro/ /vagrant/'


## Clean

clean:
	rm -rf *.egg* build dist *.pyc *.pyo cover doctest_pypi.cfg nosetests.xml \
		pylint.log *.egg output.xml flake8.log output.xml */*.pyc .coverage core \
		nohup.out bistro.spl cookbooks tmp
