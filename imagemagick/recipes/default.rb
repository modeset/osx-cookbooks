include_recipe "homebrew"

unless File.exist?("/Applications/Utilities/XQuartz.app")
  version     = "2.7.2"
  root        = Chef::Config[:file_cache_path]
  xquartz_dmg = "#{root}/XQuartz-#{version}.dmg"

  remote_file xquartz_dmg do
    source "http://xquartz.macosforge.org/downloads/SL/XQuartz-#{version}.dmg"
    action :create_if_missing
  end

  archive xquartz_dmg do
    path root
  end

  execute "sudo installer -pkg #{root}/XQuartz.pkg -target /" do
    user node[:homebrew][:user]
    creates "/Applications/Utilities/XQuartz.app"
  end
end

execute "sudo SetFile -a V /opt" do
  only_if { `GetFileInfo -aV /opt`.chomp == "0" }
  user node[:homebrew][:user]
end

package "imagemagick" do
  if node[:imagemagick][:ghostscript]
    options "--with-ghostscript"
  end
end
