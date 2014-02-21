include_recipe 'database::mysql'

mysql_connection_info = {
  host: '127.0.0.1',
  username: 'root',
  password: node[:mysql][:server_root_password]
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