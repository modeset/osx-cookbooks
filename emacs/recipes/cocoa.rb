include_recipe "emacs"

application "Emacs" do
  source "http://emacsformacosx.com/emacs-builds/Emacs-24.1-universal-10.6.8.dmg"
end

include_recipe "peepopen"
