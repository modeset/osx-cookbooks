include_recipe "homebrew"

package "mysql"

execute "mysql_install_db" do
  command [
    "mysql_install_db",
    "--user=#{node[:homebrew][:user]}",
    "--basedir=\"$(brew --prefix mysql)\"",
    "--datadir=#{node[:homebrew][:prefix]}/var/mysql",
    "--tmpdir=/tmp"
  ].join(" ")
  user node[:homebrew][:user]
  cwd node[:homebrew][:prefix]
  creates "#{node[:homebrew][:prefix]}/var/mysql/test"
end

if node[:mysql][:launchd]
  launch_service "com.mysql.mysqld" do
    template_variables :prefix => node[:homebrew][:prefix]
  end
end
