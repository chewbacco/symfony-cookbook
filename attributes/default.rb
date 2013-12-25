default[:symfony][:user] = 'symfony-app'
default[:symfony][:group] = 'symfony-app'
default[:symfony][:remove_trailing_slash] = false

default[:nginx][:default_site_enabled] = false
default[:nginx][:install_method] = 'source'
default[:nginx][:version] = '1.4.4'
default[:nginx][:configure_flags] = ['--with-http_stub_status_module']

default[:php][:packages] = %w(php5 php5-dev php5-cli php-pear)

default[:mysql][:bind_address] = '127.0.0.1'

