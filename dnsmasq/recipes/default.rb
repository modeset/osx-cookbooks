include_recipe "homebrew"

package "dnsmasq"

launch_service "uk.org.thekelleys.dnsmasq" do
  path "/Library/LaunchDaemons/uk.org.thekelleys.dnsmasq.plist"
  template_variables :user => node[:launch][:user]
end
