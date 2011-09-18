include_recipe "dropbox"
include_recipe "dropbox::conflicts"

Dir["#{node[:dropbox][:dotfiles]}/*"].each do |file|
  source, file = file, File.basename(file)

  link "#{ENV['HOME']}/.#{file}" do
    to source
    owner node[:dropbox][:user]
    group "staff"
    only_if { File.exist?(source) }
  end
end
