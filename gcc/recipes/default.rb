# 10.7 GCC Installer
unless node['platform'] == 'mac_os_x' && node['platform_version'].to_f >= 10.8
  unless File.exist?("/usr/bin/gcc-4.2")
    version = "10.7-v2"
    root    = Chef::Config[:file_cache_path]

    remote_file "#{root}/GCC-#{version}.pkg" do
      source "https://github.com/downloads/kennethreitz/osx-gcc-installer/GCC-#{version}.pkg"
      action :create_if_missing
    end

    execute "sudo installer -pkg #{root}/GCC-#{version}.pkg -target /" do
      user node[:gcc][:user]
      creates "/usr/bin/gcc-4.2"
    end
  end

# 10.8 Command Line Tools
else

  root        = Chef::Config[:file_cache_path]
  clt_dmg = "#{root}/XCode-CLT.dmg"

  remote_file clt_dmg do
    source "http://devimages.apple.com/downloads/xcode/command_line_tools_for_xcode_10_8_late_july_2012.dmg"
    action :create_if_missing
  end

  archive clt_dmg do
    path root
  end

  execute "sudo installer -pkg #{root}/Command Line Tools (Mountain Lion).pkg -target /" do
    user node[:homebrew][:user]
    creates "/usr/bin/gcc"
  end

end
