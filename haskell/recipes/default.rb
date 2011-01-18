include_recipe "homebrew"

package "ghc"
package "haskell-platform"

execute "cabal update" do
  user node[:homebrew][:user]
  not_if { File.exist?("#{ENV['HOME']}/.cabal") }
end
