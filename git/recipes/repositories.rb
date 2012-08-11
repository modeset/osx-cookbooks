node[:git][:repositories].each do |dir, url|
  git dir do
    repository url
    action :sync
    user node[:git][:user]
  end

  execute "#{dir} checkout master" do
    command "git checkout master"
    only_if { File.read("#{dir}/.git/HEAD") != "ref: refs/heads/master\n" }
    user node[:git][:user]
    cwd dir
  end

  execute "#{dir} branch --delete deploy" do
    command "git branch --delete deploy"
    only_if { File.exist?("#{dir}/.git/refs/heads/deploy") }
    user node[:git][:user]
    cwd dir
  end
end
