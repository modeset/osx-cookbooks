include_recipe "homebrew"

package "postgres"

execute "initdb #{node[:homebrew][:prefix]}/var/postgres" do
  user node[:homebrew][:user]
  creates "#{node[:homebrew][:prefix]}/var/postgres"
end

if node[:postgres][:launchd]
  launch_service "org.postgresql.postgres" do
    template_variables :prefix => node[:homebrew][:prefix],
      :user => node[:homebrew][:user]
  end
end
