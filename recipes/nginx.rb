# 1.4.4
include_recipe 'nginx'

node[:symfony][:projects].each { |project| 
  template "#{node[:nginx][:dir]}/sites-available/#{project[:domain]}.conf" do
    source 'nginx-site.conf.erb'
    variables(
       'domain' => project[:domain],
       'document_root' => project[:document_root],
       'remove_trailing_slash' => project[:remove_trailing_slash],
       'index_file' => project[:index_file],
       'default_server' => project[:default_server]
    )
  end

  nginx_site "#{project[:domain]}.conf" do
    enable true
    notifies :reload, 'service[nginx]'
  end
}
