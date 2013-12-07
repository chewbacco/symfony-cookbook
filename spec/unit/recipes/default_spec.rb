require 'spec_helper'

# describe 'symfony::default' do
#   let(:runner) do
#       # Tell rspec where the cookbooks are
#       cookbook_paths = %W(#{File.expand_path(Dir.pwd)}/vendor/cookbooks #{File.expand_path("..", Dir.pwd)})
#       ChefSpec::Runner.new({log_level: :debug, cookbook_path: cookbook_paths})
#   end
#   let(:chef_run) { runner.converge 'symfony::default' }

#   it 'includes the git::default recipe' do
#       expect(chef_run).to install_gem_package('rails')
#       #expect(runner).to include_recipe('git::default')
#   end
# end

describe 'symfony::default' do
    let(:runner) do
        ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04')  do |node|
            node.set[:mysql][:server_root_password] = 'rootpass'
            node.set[:mysql][:server_debian_password] = 'debpass'
            node.set[:mysql][:server_repl_password] = 'replpass'
            node.set[:symfony][:database][:password] = 'myapp_1234'
            node.set[:symfony][:database][:name] = 'symfony'
            node.set[:symfony][:database][:user] = 'symfony'
        end.converge(described_recipe)
    end

    before do
        stub_command("test -d /etc/php5/fpm/pools || mkdir -p /etc/php5/fpm/pools").and_return(true)
        stub_command("which sass").and_return(true)
    end

    it 'includes the git recipe' do
        expect(runner).to include_recipe('git::default')
    end
    it 'includes the symfony::nginx recipe' do
        expect(runner).to include_recipe('symfony::nginx')
    end
    it 'includes the composer recipe' do
        expect(runner).to include_recipe('composer::default')
    end
    it 'includes the php-fpm recipe' do
        expect(runner).to include_recipe('php-fpm::default')
    end
    it 'includes the php recipe' do
        expect(runner).to include_recipe('php::default')
    end
    it 'includes the php::module_mysql recipe' do
        expect(runner).to include_recipe('php::module_mysql')
    end
    it 'includes the mysql::client recipe' do
        expect(runner).to include_recipe('mysql::client')
    end
    it 'includes the mysql::server recipe' do
        expect(runner).to include_recipe('mysql::server')
    end
    it 'includes the database::mysql recipe' do
        expect(runner).to include_recipe('database::mysql')
    end
end