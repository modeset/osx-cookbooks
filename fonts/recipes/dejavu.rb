# http://dejavu-fonts.org/wiki/index.php?title=Main_Page

%w( DejaVuSansMono-Bold DejaVuSansMono-BoldOblique DejaVuSansMono-Oblique DejaVuSansMono ).each do |filename|
  cookbook_file "#{node[:fonts][:path]}/#{filename}.ttf" do
    mode 0444
    owner node[:fonts][:user]
    group "staff"
  end
end
