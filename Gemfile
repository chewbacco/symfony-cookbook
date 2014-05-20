source 'https://rubygems.org'
ruby "2.1.1"

group :unit do
  gem 'berkshelf',  '3.1.2'
  gem 'chefspec',   '~> 3.4.0'
end

group :lint do
  gem 'foodcritic', '~> 3.0.3'
  gem 'rubocop',    '~> 0.21.0'
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
