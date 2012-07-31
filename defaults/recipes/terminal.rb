defaults "com.apple.Terminal", "Shell" do
  value node[:apple][:terminal][:shell]
end

defaults "com.apple.Terminal", "Default Window Settings" do
  value node[:apple][:terminal][:default_settings]
end

defaults "com.apple.Terminal", "Startup Window Settings" do
  value node[:apple][:terminal][:default_settings]
end
