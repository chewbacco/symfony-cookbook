include_recipe 'php-fpm'

ruby_block 'php-fpm-ini' do
  block do
    file = Chef::Util::FileEdit.new('/etc/php5/fpm/php.ini')
      node['php-fpm']['directives'].sort_by { |key, val| key }.each do |directive, value|
        file.insert_line_if_no_match(/^\s+#{directive}\s+=\s+\"#{value}\"/, "#{directive}=\"#{value}\"")
      end
    file.write_file
  end
  notifies :restart, 'service[php-fpm]'
  only_if { node['php-fpm']['directives'] }
end

package 'php5-mysql' do
  action :install
end
