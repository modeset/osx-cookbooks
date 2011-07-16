include_recipe "homebrew"

package "ruby"

node[:ruby][:gems].each do |gem|
  gem_package gem
end
