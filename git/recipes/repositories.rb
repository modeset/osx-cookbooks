node[:git][:repositories].each do |dir, url|
  git dir do
    repository url
    action :sync
    user node[:git][:user]
  end

  execute "git checkout master" do
    only_if { `git --git-dir #{dir}/.git symbolic-ref HEAD` =~ /master/ }
    user node[:git][:user]
    cwd dir
  end

  execute "git branch --delete deploy" do
    only_if { `git --git-dir #{dir}/.git branch --list` =~ /deploy/ }
    user node[:git][:user]
    cwd dir
  end
end
