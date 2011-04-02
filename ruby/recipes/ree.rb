include_recipe "homebrew"

package "ruby-enterprise-edition" do
  options "--enable-shared"
end

gem_package "json"

node[:ruby][:gems].each do |gem|
  gem_package gem
end
