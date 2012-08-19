require 'chef/provider/package'

require 'open-uri'
require 'json'

class Chef::Provider::Package::Rbenv < ::Chef::Provider
  def initialize(new_resource, run_context)
    super

    @user = run_context.node[:rbenv][:user]
  end

  include Chef::Mixin::Command

  def load_current_resource
  end

  def action_install
    resource, user = @new_resource, @user
    execute "rbenv install #{resource.definition}" do
      command "ruby-build #{resource.definition} #{resource.prefix}"
      user user
      not_if { ::File.exist?(resource.prefix) }
    end
  end

  def action_remove
    directory @new_resource.prefix do
      recursive true
      action :delete
    end
  end
end
