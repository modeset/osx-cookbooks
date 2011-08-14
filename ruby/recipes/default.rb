include_recipe "homebrew"

package "ruby"
package "rbenv"

node[:ruby][:gems].each do |gem|
  gem_package gem
end
