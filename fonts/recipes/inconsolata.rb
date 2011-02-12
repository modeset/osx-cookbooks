# http://www.levien.com/type/myfonts/inconsolata.html

cookbook_file "#{node[:fonts][:path]}/Inconsolata.otf" do
  mode 0444
  owner node[:fonts][:user]
  group "staff"
end
