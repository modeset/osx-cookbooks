include_recipe "dropbox"

out = `find #{node[:dropbox][:dotfiles]} -name '*conflicted*' -print`
out.lines.each do |path|
  file path.chomp do
    action :delete
  end
end

Dir["#{node[:dropbox][:dotfiles]}/*"].each do |file|
  source, file = file, File.basename(file)

  link "#{ENV['HOME']}/.#{file}" do
    to source
    owner node[:dropbox][:user]
    group "staff"
    only_if { File.exist?(source) }
  end
end
