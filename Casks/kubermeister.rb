# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.4.0, d9a63972908d549d12af6d5d3d3446713e908d923964eed99e280d0e9d3cfef1 and 70323d5e0cb7aa8e457d2abb08abed6003a51ef0a25cc7f594fa7dfa46698781 and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.4.0"

  on_arm do
    sha256 "d9a63972908d549d12af6d5d3d3446713e908d923964eed99e280d0e9d3cfef1"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "70323d5e0cb7aa8e457d2abb08abed6003a51ef0a25cc7f594fa7dfa46698781"
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
