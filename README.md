## ChefPackage

Package resources for compile time installs

### Reason

In some cases, generally now using the chef_gem resource, it is required
to have system packages installed at compile time. This allows chef_gem
to properly install gems that may have requirements for compiling libraries.

### Special case

Unlike the chef_gem package, there may be other resources depending on notifications
from system packages since they are not segregated in the same manner as chef_gem.
To allow for this, when a chef_package resource is created, a dynamic package
resource is also created, which will proxy the chef_package notifications to other
resources depending on them.

### Example

```ruby
chef_package 'tmux'

ruby_block 'tmux notification' do
  block do
    Chef::Log.info 'Package "tmux" was installed!'
  end
  action :nothing
  subscribes :create, resources(:package => 'tmux'), :immediately
end
```

Delayed notifications will be sent at the end of the run. Immediate notifications
will be sent at the start of the excute phase of the run. 

### Note about chef_package notifications

Just like the existing ChefGem resource, the run_action is called directly against
the resource, not via the runner. This means that chef_package based resources
will not provide notifications.

### Note about compatiblity

This cookbook is currently _only_ compatible with Chef >= 10.14.0

## Infos
* Repository: https://github.com/hw-cookbooks/chef_package
