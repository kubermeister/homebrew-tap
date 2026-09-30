# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.9.2, b6a56408ab22aa6375fb366cc7aa3110fd694f72a1af88df2c5bf96309d84aad and 430ac0d486583fc58e0bd915296778aeb5c0a05d0433374b0f01d106391d6ade and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.9.2"

  on_arm do
    sha256 "b6a56408ab22aa6375fb366cc7aa3110fd694f72a1af88df2c5bf96309d84aad"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "430ac0d486583fc58e0bd915296778aeb5c0a05d0433374b0f01d106391d6ade"
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
