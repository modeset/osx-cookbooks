# http://www.proggyfonts.com/index.php?menu=download

cookbook_file "#{node[:fonts][:path]}/ProggyClean.ttf" do
  mode 0444
  owner node[:fonts][:user]
  group "staff"
end
