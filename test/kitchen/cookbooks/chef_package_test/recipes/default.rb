chef_package 'screen'

execute 'screen package notification' do
  command 'touch /tmp/package.not'
  action :nothing
  subscribes :run, resources(:package => 'screen')
end

execute 'screen chef_package notification' do
  command 'touch /tmp/chef_package.not'
  action :nothing
  subscribes :run, resources(:chef_package => 'screen')
end
