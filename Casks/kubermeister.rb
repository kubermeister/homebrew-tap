# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.6.0, 7a14bc31347f593f7133bcf1c2a05f1126094df984e587c9d3e28efa2ed84ce4 and 7cbc8de0b0629c58ac193e4bf251224e9f7bb18bebe368fe7df6360918bf2c40 and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.6.0"

  on_arm do
    sha256 "7a14bc31347f593f7133bcf1c2a05f1126094df984e587c9d3e28efa2ed84ce4"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "7cbc8de0b0629c58ac193e4bf251224e9f7bb18bebe368fe7df6360918bf2c40"
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
