include_recipe "dropbox"

node[:dropbox][:conflicts].each do |filename|
  path = File.join(node[:dropbox][:path], filename)
  out = `find #{path} -name '*conflicted*' -print`
  out.lines.each do |path|
    file path.chomp do
      action :delete
    end
  end
end
