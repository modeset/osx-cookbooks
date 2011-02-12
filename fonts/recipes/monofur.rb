# http://www.dafont.com/monofur.font

%w( monof55 monof56 ).each do |filename|
  cookbook_file "#{node[:fonts][:path]}/#{filename}.ttf" do
    mode 0444
    owner node[:fonts][:user]
    group "staff"
  end
end
