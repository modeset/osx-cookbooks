default.handbrake[:version] = "0.9.8"
default.handbrake[:user]    = ENV['SUDO_USER'] || ENV['USER']
default.handbrake[:prefix]  = "/usr/local"
