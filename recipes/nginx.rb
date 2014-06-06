# 1.4.4
include_recipe 'nginx'

node[:symfony][:projects].each { |project|
  template "#{node[:nginx][:dir]}/sites-available/#{project[:name]}.conf" do
    source 'nginx-site.conf.erb'
    variables(
       'domain' => project[:domain],
       'listen' => project[:listen] || 80,
       'aliases' => project[:aliases],
       'document_root' => project[:document_root],
       'remove_trailing_slash' => project[:remove_trailing_slash],
       'index_file' => project[:index_file],
       'default_server' => project[:default_server] || false,
       'project_name' => project[:name]
    )
  end

  nginx_site "#{project[:domain]}.conf" do
    enable true
    notifies :reload, 'service[nginx]'
  end
}
