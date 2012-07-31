include_recipe "dropbox"
include_recipe "dropbox::conflicts"

Dir["#{node[:dropbox][:dotfiles]}/*"].each do |file|
  source, file = file, File.basename(file)
  target = "#{ENV['HOME']}/.#{file}"

  if !File.symlink?(target)
    if File.directory?(target)
      directory target do
        action :delete
      end
    elsif File.file?(target)
      file target do
        action :delete
      end
    end
  end

  link target do
    to source
    owner node[:dropbox][:user]
    group "staff"
    only_if { File.exist?(source) }
  end
end
