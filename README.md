# symfony Cookbook

[![Build Status](https://travis-ci.org/chewbacco/symfony-cookbook.png?branch=master)](https://travis-ci.org/chewbacco/symfony-cookbook) [![Dependency Status](https://gemnasium.com/chewbacco/symfony-cookbook.png)](https://gemnasium.com/chewbacco/symfony-cookbook) [![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/chewbacco/symfony-cookbook/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

## Requirements

###Cookbooks
The following cookbooks are direct dependencies because they're used for common "default" functionality.

- [nginx](https://github.com/opscode-cookbooks/nginx)
- [php](https://github.com/opscode-cookbooks/php) 
- [php-fpm](https://github.com/yevgenko/cookbook-php-fpm)

The following cookbook is not a strict dependency because its use can be controlled by an attribute, so it may not be a common "default."
- [rvm](https://github.com/opscode-cookbooks/nginx) (for sass)

###Platforms
The following platforms are supported:

- Ubuntu 10.04, Ubuntu 12.04
- CentOS 5.8, 6.3

Other Debian and RHEL family distributions are assumed to work.

# Usage

# Attributes

# Recipes


## Testing

This cookbook uses a variety of testing components:

- Unit tests: [ChefSpec](https://github.com/acrmp/chefspec)
- Integration tests: [Test Kitchen](https://github.com/opscode/test-kitchen)
- Chef Style lints: [Foodcritic](https://github.com/acrmp/foodcritic)
- Ruby Style lints: [Rubocop](https://github.com/bbatsov/rubocop)


Prerequisites
-------------
To develop on this cookbook, you must have a sane Ruby 1.9+ environment. Given the nature of this installation process (and it's variance across multiple operating systems), we will leave this installation process to the user.

You must also have `bundler` installed:

    $ gem install bundler

You must also have Vagrant and VirtualBox installed:

- [Vagrant](https://vagrantup.com)
- [VirtualBox](https://virtualbox.org)

Once installed, you must install the `vagrant-berkshelf` plugin:

    $ vagrant plugin install vagrant-berkshelf


Development
-----------
1. Clone the git repository from GitHub:

        $ git clone git@github.com:opscode-cookbooks/COOKBOOK.git

2. Install the dependencies using bundler:

        $ bundle install

3. Create a branch for your changes:

        $ git checkout -b my_bug_fix

4. Make any changes
5. Write tests to support those changes. It is highly recommended you write both unit and integration tests.
6. Run the tests:
    - `bundle exec rspec`
    - `bundle exec foodcritic .`
    - `bundle exec rubocop`
    - `bundle exec kitchen test`

7. Assuming the tests pass, open a Pull Request on GitHub