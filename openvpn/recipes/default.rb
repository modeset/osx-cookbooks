include_recipe "homebrew"

package "openvpn"

unless File.exist?("/Library/Extensions/tun.kext")
  root       = Chef::Config[:file_cache_path]
  version    = "20090913"
  tuntap_dir = "#{root}/tuntap_#{version}"
  tuntap_tar = "#{root}/tuntap_#{version}.tar.gz"
  
  remote_file tuntap_tar do
    source "http://downloads.sourceforge.net/project/tuntaposx/tuntap/#{version}/tuntap_#{version}.tar.gz"
    action :create_if_missing
  end

  archive tuntap_tar do
    path tuntap_dir
    not_if { File.exist?(tuntap_dir) }
  end

  # Installs
  #   /Library/Extensions/tap.kext
  #   /Library/Extensions/tun.kext
  #   /Library/StartupItems/tap
  #   /Library/StartupItems/tun
  #
  execute "sudo installer -pkg #{tuntap_dir}/tuntap_#{version}.pkg -target /" do
    user node[:homebrew][:user]
  creates "/Library/Extensions/tun.kext"
  end
end
