# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 1.0.1, b22f25d63a980eca7e628b27eddab519bc036606c1514651bd9396073c6c2e4b and 822a863ff868563247bcb08e7cdb44c2f96cb3431ff78f3939ee4783494361ce and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "1.0.1"

  on_arm do
    sha256 "b22f25d63a980eca7e628b27eddab519bc036606c1514651bd9396073c6c2e4b"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "822a863ff868563247bcb08e7cdb44c2f96cb3431ff78f3939ee4783494361ce"
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
