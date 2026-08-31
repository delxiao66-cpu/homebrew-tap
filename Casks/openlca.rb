cask "openlca" do
  version :latest
  sha256 :no_check

  url "https://share.greendelta.com/index.php/s/oeXokWrthjwC9z4/download",
      verified: "share.greendelta.com/"

  name "openLCA"
  desc "Life cycle assessment and sustainability modeling software"
  homepage "https://www.openlca.org/"

  app "openLCA.app"
end
