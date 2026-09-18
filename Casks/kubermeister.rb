# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.4.1, 74816878df5b21e8a1885c05235f460b2f082cf3d4cf0d2ec4de2e02275ea2ba and 27c9411ad530e4508d320c765fab0672d4407a4d6716f6926ce5bf09844294ff and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.4.1"

  on_arm do
    sha256 "74816878df5b21e8a1885c05235f460b2f082cf3d4cf0d2ec4de2e02275ea2ba"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "27c9411ad530e4508d320c765fab0672d4407a4d6716f6926ce5bf09844294ff"
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
