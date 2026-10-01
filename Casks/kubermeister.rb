# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.9.4, 27dba780d6f3b5266009563be59af719ccf12d4b948359283ed790d7b80ca833 and 782d1ed0acbd95c689898c5e865bdcb31178c810aa85c7d43b85cc0817e72aa7 and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.9.4"

  on_arm do
    sha256 "27dba780d6f3b5266009563be59af719ccf12d4b948359283ed790d7b80ca833"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "782d1ed0acbd95c689898c5e865bdcb31178c810aa85c7d43b85cc0817e72aa7"
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
