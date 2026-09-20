cask "netease-popcorn" do
  version "2.10.2"
  sha256 "00da36e15908b868b4ef55156f04c35b0ae0057ed537b27ab9c1451c96a86cbd"

  url "https://a57.gdl.netease.com/BaoMiHua-#{version}.dmg",
      verified: "gdl.netease.com/"
  name "网易爆米花"
  desc "Media library and player from NetEase"
  homepage "https://bmh.163.com/"

  depends_on macos: ">= :sonoma"

  app "网易爆米花.app"
end
