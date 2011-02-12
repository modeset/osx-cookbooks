# http://www.gnome.org/fonts/

%w( VeraMoBd VeraMoBI VeraMoIt VeraMono ).each do |filename|
  cookbook_file "#{node[:fonts][:path]}/#{filename}.ttf" do
    mode 0444
    owner node[:fonts][:user]
    group "staff"
  end
end
