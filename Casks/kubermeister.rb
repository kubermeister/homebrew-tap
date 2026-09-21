# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.4.9, 5d40587e4d1937d8fc7411304f1f783cba855f9ee3feb499670d39db4cf2a128 and a332ba2bc805fc77b2c1b8218ed804794bca5c86116f218b00b4c43acbbb602b and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.4.9"

  on_arm do
    sha256 "5d40587e4d1937d8fc7411304f1f783cba855f9ee3feb499670d39db4cf2a128"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "a332ba2bc805fc77b2c1b8218ed804794bca5c86116f218b00b4c43acbbb602b"
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
