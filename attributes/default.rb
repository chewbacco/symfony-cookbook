default[:symfony][:user] = 'symfony-app'
default[:symfony][:group] = 'symfony-app'

default[:symfony][:remove_trailing_slash] = false

default[:nginx][:default_site_enabled] = false
default[:nginx][:version] = '1.4.3'

default[:php][:packages] = %w(php5 php5-dev php5-cli php-pear)

default[:mysql][:bind_address] = '127.0.0.1'

# olny dev
default[:nginx][:sendfile] = 'off'
