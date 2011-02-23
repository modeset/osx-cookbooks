include_recipe "homebrew"

package "postgresql"

execute "initdb #{node[:homebrew][:prefix]}/var/postgres" do
  user node[:homebrew][:user]
  creates "#{node[:homebrew][:prefix]}/var/postgres"
end

if node[:postgresql][:launchd]
  launch_service "org.postgresql.postgres" do
    template_variables :prefix => node[:homebrew][:prefix],
      :user => node[:homebrew][:user]
  end
end
