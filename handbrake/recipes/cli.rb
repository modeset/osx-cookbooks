bin = "#{node[:handbrake][:prefix]}/bin/HandBrakeCLI"

unless File.exist?(bin)
  root          = Chef::Config[:file_cache_path]
  handbrake_dmg = "HandBrake-#{node[:handbrake][:version]}-MacOSX.6_CLI_x86_64.dmg"

  remote_file "#{root}/#{handbrake_dmg}" do
    source "http://handbrake.fr/rotation.php?file=#{handbrake_dmg}"
    action :create_if_missing
  end

  archive "#{root}/#{handbrake_dmg}" do
    path root
  end

  execute "cp #{root}/HandBrakeCLI #{bin}" do
    user node[:handbrake][:user]
    creates bin
  end
end
