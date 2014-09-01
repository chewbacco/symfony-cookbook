name             'symfony'
maintainer       'Dmitry Tsoy'
maintainer_email 'hd.deman@gmail.com'
license          'All rights reserved'
description      'Deploys and configures Symfony-based applications'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.6'

depends 'nginx', '~> 2.7.4'
depends 'php-fpm', '~> 0.6.10'
depends 'php', '~> 1.4.6'
depends 'mysql', '~> 5.4.0' #https://github.com/opscode-cookbooks/database/issues/79
depends 'database', '~> 2.3.0'
depends 'rbenv', '~> 1.7.1'
depends 'git', '~> 4.0.2'
depends 'composer', '~> 1.0.4'
