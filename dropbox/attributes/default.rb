default.dropbox[:user]      = ENV['SUDO_USER'] || ENV['USER']
default.dropbox[:path]      = "#{ENV['HOME']}/Dropbox"
default.dropbox[:dotfiles]  = "#{ENV['HOME']}/Dropbox/.dotfiles"
