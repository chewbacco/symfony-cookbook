#
# Cookbook Name:: symfony
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

group node[:symfony][:group]

user node[:symfony][:user] do
  group node[:symfony][:group]
  system true
  shell '/bin/bash'
end

# apt-force-yes globaly
file '/etc/apt/apt.conf.d/90forceyes' do
  content "APT::Get::force-yes \"true\";\n"
end

# @todo move this block to spec cookbook
apt_repository 'ondrej-php' do
  uri 'http://ppa.launchpad.net/ondrej/php5/ubuntu'
  distribution node[:lsb][:codename]
  components ['main']
  keyserver 'keyserver.ubuntu.com'
  key '8D0DC64F'
  # key "E5267A6C"
  action :add
end

execute 'apt-get update'

include_recipe 'rbenv::default'
include_recipe 'rbenv::ruby_build'

rbenv_ruby '2.1.2' do
  ruby_version '2.1.2'
  global true
end

# if ubuntu 12
# package 'rubygems'
# if ubuntu 14
package 'rubygems-integration'

execute 'gem install sass' do
  not_if 'which sass'
end

include_recipe 'symfony::nginx'

include_recipe 'composer::install'

include_recipe 'symfony::php-fpm'

include_recipe 'git::default'
include_recipe 'php'
# include_recipe 'rvm::system'
