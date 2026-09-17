cask "kubermeister@tip" do
  version :latest
  sha256 :no_check

  on_arm do
    url "https://github.com/kubermeister/kubermeister/releases/download/tip/Kubermeister-tip-mac-arm64.dmg"
  end
  on_intel do
    url "https://github.com/kubermeister/kubermeister/releases/download/tip/Kubermeister-tip-mac-x64.dmg"
  end

  name "Kubermeister Tip"
  desc "Desktop Kubernetes client, nightly build"
  homepage "https://github.com/kubermeister/kubermeister"

  auto_updates true

  app "Kubermeister Tip.app"

  zap trash: [
    "~/Library/Application Support/Kubermeister Tip",
    "~/Library/Caches/io.kubermeister.tip",
    "~/Library/Preferences/io.kubermeister.tip.plist",
    "~/Library/Saved Application State/io.kubermeister.tip.savedState",
  ]
end
