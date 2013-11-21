name             'symfony'
maintainer       'Dmitry Tsoy'
maintainer_email 'hd.deman@gmail.com'
license          'All rights reserved'
description      'Deploys and configures Symfony-based applications'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.2'

depends "nginx", "~> 2.0.4"
depends "php-fpm", "~> 0.5.0"
depends "php", "~> 1.2.6"
depends "mysql", "~> 4.0.4"
depends "database", "~> 1.5.2"
depends "rvm", "~> 0.9.1"
depends "git", "~> 2.7.0"