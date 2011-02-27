include_recipe "homebrew"

package "ruby-enterprise-edition" do
  options "--enable-shared"
end

node[:ruby][:gems].each do |gem|
  gem_package gem
end
