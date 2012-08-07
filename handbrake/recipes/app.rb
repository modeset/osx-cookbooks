application "Handbrake" do
  source "http://handbrake.fr/rotation.php?file=HandBrake-#{node[:handbrake][:version]}-MacOSX.6_GUI_x86_64.dmg"
end
