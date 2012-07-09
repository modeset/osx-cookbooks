bash "install_pow" do
  user node[:homebrew][:user]
  cwd "/Users/#{node[:homebrew][:user]}"
  code "curl get.pow.cx | sh"
end
