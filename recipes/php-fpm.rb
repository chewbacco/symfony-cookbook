include_recipe 'php-fpm'

ruby_block 'php-fpm-ini' do
  block do
    file = Chef::Util::FileEdit.new('/etc/php5/fpm/php.ini')
      # rubocop:disable SymbolName
      node[:'php-fpm'][:directives].sort_by { |key, val| key }.each do |directive, value|
        # rubocop:enable SymbolName
        file.insert_line_if_no_match(/^\s+#{directive}\s+=\s+\"#{value}\"/, "#{directive}=\"#{value}\"")
      end
    file.write_file
  end
  notifies :restart, 'service[php-fpm]'
end
