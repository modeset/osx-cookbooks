default.dotfiles[:user] = ENV['SUDO_USER'] || ENV['USER']
default.dotfiles[:home] = ENV['HOME']
default.dotfiles[:path] = "#{ENV['HOME']}/.dotfiles"
