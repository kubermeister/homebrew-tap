# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.5.1, 58f4360adcf7d2965a1de5d51a849434e459692d50ebb0a02759b05de3da22e8 and bcfd3cf8f22443f2e4acaa68e8c975edeaf9e2968caabbeb97e0d1855210949c and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.5.1"

  on_arm do
    sha256 "58f4360adcf7d2965a1de5d51a849434e459692d50ebb0a02759b05de3da22e8"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "bcfd3cf8f22443f2e4acaa68e8c975edeaf9e2968caabbeb97e0d1855210949c"
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
