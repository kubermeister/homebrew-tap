# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.6.2, a7380de9187ff9916c3c44e118b5eb04b8e26edd65ebc3b3d2db77a93a0fb0c7 and 7486f131544e95975f3c2cc7933a36bd480a240e8dd9f9cec0b228898df89e3d and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.6.2"

  on_arm do
    sha256 "a7380de9187ff9916c3c44e118b5eb04b8e26edd65ebc3b3d2db77a93a0fb0c7"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "7486f131544e95975f3c2cc7933a36bd480a240e8dd9f9cec0b228898df89e3d"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-x64.dmg"
  end

  name "Kubermeister"
  desc "Desktop Kubernetes client"
  homepage "https://github.com/kubermeister/kubermeister"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself with electron-updater; brew upgrade still works but is not required.
  auto_updates true

  app "Kubermeister.app"

  zap trash: [
    "~/Library/Application Support/Kubermeister",
    "~/Library/Caches/io.kubermeister.app",
    "~/Library/Preferences/io.kubermeister.app.plist",
    "~/Library/Saved Application State/io.kubermeister.app.savedState",
  ]
end
