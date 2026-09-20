# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.4.6, 71a63ecc5d8dffab93ea5f3e48f2c0ee01191ac9642d63eade91aa9b7052b700 and c3181fa28bd3e877401c683ca667623e1c213a813682df9c409b17932a0a048d and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.4.6"

  on_arm do
    sha256 "71a63ecc5d8dffab93ea5f3e48f2c0ee01191ac9642d63eade91aa9b7052b700"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "c3181fa28bd3e877401c683ca667623e1c213a813682df9c409b17932a0a048d"
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
