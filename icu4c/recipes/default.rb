include_recipe "homebrew"

package "icu4c"

execute "brew link icu4c" do
  not_if { File.exist?("#{node[:homebrew][:prefix]}/bin/icu-config") }
  user node[:homebrew][:user]
end
