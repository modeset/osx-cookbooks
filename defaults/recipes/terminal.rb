defaults "com.apple.Terminal", "Default Window Settings" do
  value node[:apple][:terminal][:default_settings]
end

defaults "com.apple.Terminal", "Startup Window Settings" do
  value node[:apple][:terminal][:default_settings]
end

if settings = node[:apple][:terminal][:settings]
  installed_settings = `defaults read com.apple.Terminal "Window Settings"`
  for url in settings
    name   = URI.unescape(File.basename(url, ".terminal"))
    target = "#{Chef::Config[:file_cache_path]}/#{name}.terminal"

    unless installed_settings.match(name)
      remote_file target do
        source url
        owner node[:defaults][:user]
        group "staff"
        action :create_if_missing
      end
      execute "install #{name}" do
        command "open #{target.inspect}"
      end
    end
  end
end
