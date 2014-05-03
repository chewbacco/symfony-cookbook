default[:symfony][:user] = 'symfony-app'
default[:symfony][:group] = 'symfony-app'
default[:symfony][:remove_trailing_slash] = false

override[:nginx][:default_site_enabled] = false
override[:nginx][:install_method] = 'source'
override[:nginx][:version] = '1.4.7'
override[:nginx][:configure_flags] = ['--with-http_stub_status_module']

default[:php][:packages] = %w(php5 php5-dev php5-cli php-pear)

default[:mysql][:bind_address] = '127.0.0.1'

