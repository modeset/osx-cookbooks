include_recipe "homebrew"
include_recipe "xquartz"

package "imagemagick" do
  if node[:imagemagick][:ghostscript]
    options "--with-ghostscript"
  end
end
