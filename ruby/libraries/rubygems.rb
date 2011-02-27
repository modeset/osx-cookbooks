require 'chef/provider/package'
require 'chef/provider/package/rubygems'

class Chef::Provider::Package::Rubygems < ::Chef::Provider::Package
  def initialize(new_resource, run_context = nil)
    super
    new_resource.gem_binary 'gem' unless new_resource.gem_binary
    @gem_env = AlternateGemEnvironment.new(new_resource.gem_binary)
    @user = run_context.node[:ruby][:user]
  end

  def install_via_gem_command(name, version)
    src = @new_resource.source && "  --source=#{@new_resource.source} --source=http://rubygems.org"
    shell_out!("#{gem_binary_path} install #{name} -q --no-rdoc --no-ri -v \"#{version}\"#{src}#{opts}", :env => nil, :user => @user)
  end

  def uninstall_via_gem_command(name, version)
    if version
      shell_out!("#{gem_binary_path} uninstall #{name} -q -x -I -v \"#{version}\"#{opts}", :env => nil, :user => @user)
    else
      shell_out!("#{gem_binary_path} uninstall #{name} -q -x -I -a#{opts}", :env => nil, :user => @user)
    end
  end
end
