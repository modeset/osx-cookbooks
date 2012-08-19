include_recipe "homebrew"
include_recipe "gcc"

package "rbenv"
package "ruby-build"

node[:rbenv][:versions].each do |version|
  rbenv_version version
end

if version = node[:rbenv][:global]
  execute "rbenv global #{version}" do
    user node[:rbenv][:user]
    not_if { File.exist?("#{node[:rbenv][:root]}/version") }
  end
end
