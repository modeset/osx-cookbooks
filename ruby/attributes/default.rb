default.ruby[:default] = "ree"
default.ruby[:user] = ENV['SUDO_USER'] || ENV['USER']
default.ruby[:gems] = []
