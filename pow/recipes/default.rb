execute "curl get.pow.cx | sh" do
  user node[:homebrew][:user]
end
