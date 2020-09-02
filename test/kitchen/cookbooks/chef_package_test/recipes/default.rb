chef_package 'screen'

execute 'screen package notification' do
  command 'touch /tmp/package.not'
  action :nothing
  subscribes :run, 'package[screen]'
end

execute 'screen chef_package notification' do
  command 'touch /tmp/chef_package.not'
  action :nothing
  subscribes :run, 'chef_package[screen]'
end
