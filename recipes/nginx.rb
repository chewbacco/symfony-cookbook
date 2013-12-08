# 1.4.3
include_recipe 'nginx'

template "#{node[:nginx][:dir]}/sites-available/#{node[:symfony][:domain]}.conf" do
  source 'nginx-site.conf.erb'
  notifies :reload, 'service[nginx]'
end

nginx_site "#{node[:symfony][:domain]}.conf" do
  enable true
end
