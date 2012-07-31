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
