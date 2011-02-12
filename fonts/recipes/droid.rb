# http://www.ascendercorp.com/pr/2007-11-12/
# http://damieng.com/blog/2007/11/14/droid-font-family-courtesy-of-google-ascender

cookbook_file "#{node[:fonts][:path]}/DroidSansMono.ttf" do
  mode 0444
  owner node[:fonts][:user]
  group "staff"
end
