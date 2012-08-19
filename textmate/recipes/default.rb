application "TextMate" do
  source "http://download.macromates.com/TextMate_1.5.11_r1635.zip"
end

link "/usr/local/bin/mate" do
  to "/Applications/TextMate.app/Contents/SharedSupport/Support/bin/mate"
  owner node[:textmate][:user]
  group "staff"
end
