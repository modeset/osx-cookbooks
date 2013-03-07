include_recipe "git"

application "GitHub" do
  appcast "https://central.github.com/mac/appcast.xml"
end

link "#{node[:homebrew][:prefix]}/bin/github" do
  to "/Applications/GitHub.app/Contents/MacOS/github_cli"
  owner node[:homebrew][:user]
  group "staff"
end
