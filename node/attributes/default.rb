default.npm[:user] = ENV['SUDO_USER'] || ENV['USER']

default.npm[:globalconfig] = "/usr/local/etc/npmrc"

default.npm[:root]    = "/usr/local/lib/node"
default.npm[:binroot] = "/usr/local/bin"
default.npm[:manroot] = "/usr/local/share/man"
