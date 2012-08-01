if !File.exist?("/Applications/Xcode.app")
  raise "Install Xcode from App Store"
end

execute "sudo xcode-select -switch #{node[:xcode][:path]}" do
  not_if { `xcode-select -print-path`.chomp == node[:xcode][:path] }
  user node[:xcode][:user]
end
