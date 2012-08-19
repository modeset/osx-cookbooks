require 'chef/resource/package'

class Chef::Resource::RbenvVersion < ::Chef::Resource
  def initialize(definition, run_context = nil)
    super("rbenv version #{definition}", run_context)

    @resource_name = :rbenv_version
    @provider      = Chef::Provider::Package::Rbenv

    @definition = definition

    @action = "install"
    @allowed_actions.push(:install, :remove)
  end

  def prefix
    "#{run_context.node[:rbenv][:root]}/versions/#{@definition}"
  end

  def definition(arg = nil)
    set_or_return(:definition, arg, :kind_of => [String])
  end
end
