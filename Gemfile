source 'https://rubygems.org'
ruby "2.1.2"

gem 'rake', '~> 10.3.2'

group :unit do
  gem 'berkshelf',  '3.1.5'
  gem 'chefspec',   '~> 4.0.2'
end

group :lint do
  gem 'foodcritic', '~> 4.0.0'
  gem 'rubocop',    '~> 0.25.0'
end

group :integration do
  gem 'test-kitchen',    '~> 1.2.1'
end

group :kitchen_vagrant do
  gem 'kitchen-vagrant', '~> 0.15.0'
end

group :kitchen_cloud do
  gem 'kitchen-ec2', '~> 0.8.0'
  gem 'unf'
end
