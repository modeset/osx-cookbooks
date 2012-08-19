execute "softwareupdate" do
  command "sudo softwareupdate --install --all"
  # TODO: Check for updates before running resource
  #   sudo softwareupdate --list
end
