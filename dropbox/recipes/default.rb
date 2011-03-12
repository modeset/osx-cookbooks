execute "ensure Dropbox exists" do
  command "sh -c 'exit 1'"
  creates node[:dropbox][:path]
end
