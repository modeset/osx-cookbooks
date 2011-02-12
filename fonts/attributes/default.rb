default.fonts[:user] = ENV['SUDO_USER'] || ENV['USER']
default.fonts[:path] = "#{ENV['HOME']}/Library/Fonts"
