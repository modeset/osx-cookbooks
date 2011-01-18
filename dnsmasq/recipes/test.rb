include_recipe "dnsmasq"

template "/usr/local/etc/dnsmasq.conf" do
  source "dnsmasq.conf"

  owner node[:homebrew][:user]
  group "staff"
end

directory "/etc/resolver" do
  action :create
  owner "root"
  group "wheel"
end

template "/etc/resolver/test" do
  source "test"

  owner "root"
  group "wheel"
  mode 0755
end
