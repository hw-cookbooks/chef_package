require 'minitest/spec'

describe_recipe 'chef_package_test::default' do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  describe 'chef_package_test' do
    it 'should install the screen package' do
      package('screen').must_be_installed
    end

    it 'should create a package resource notification file' do
      file('/tmp/package.not').must_exist
    end

    it 'should create a chef_pacakge resource notification file' do
      file('/tmp/chef_package.not').wont_exist
    end
  end
end
