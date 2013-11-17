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
  shell "/bin/bash"
end

#apt-force-yes globaly
file '/etc/apt/apt.conf.d/90forceyes' do
  content "APT::Get::force-yes \"true\";\n"
end

# @todo move this block to spec cookbook
apt_repository "ondrej-php" do
  uri "http://ppa.launchpad.net/ondrej/php5/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "8D0DC64F"
  #key "E5267A6C"
  action :add
end
#execute "apt-key update"
execute "apt-get update"

#1.4.3
include_recipe "nginx"

template "#{node[:nginx][:dir]}/sites-available/#{node[:symfony][:domain]}.conf" do
  source "nginx-site.conf.erb"
  notifies :reload, "service[nginx]"
end

nginx_site "#{node[:symfony][:domain]}.conf" do
  enable true
end

include_recipe "php-fpm"

ruby_block "php-fpm-ini" do
  block do
    file = Chef::Util::FileEdit.new("/etc/php5/fpm/php.ini")
    node['php-fpm'][:directives].sort_by { |key, val| key }.each do |directive, value|
      file.insert_line_if_no_match(/^\s+#{directive}\s+=\s+\"#{value}\"/, "#{directive}=\"#{value}\"")
    end
    file.write_file
  end
  notifies :restart, "service[php-fpm]"
end

include_recipe "git"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "database::mysql"

include_recipe "rvm"

mysql_connection_info = {
  :host => "127.0.0.1",
  :username => 'root',
  :password => node[:mysql][:server_root_password]
}

mysql_database node[:symfony][:database][:name] do
  connection mysql_connection_info
  action :create
end

mysql_database_user node[:symfony][:database][:user] do
  connection mysql_connection_info
  password node[:symfony][:database][:password]
  database_name node[:symfony][:database][:name]
  host '%'
  action :grant
end

Package "rubygems"

Execute "gem install sass" do
    not_if "which sass"
end