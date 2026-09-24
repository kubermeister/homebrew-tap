# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.6.1, d07292d6b41e36e2081989d029ead2fc947261e2c854e3c330934d62d528dc52 and 556e76f1e07bcb7b4ba8f685cce1e09177d63f95e4c92818b0acca1b4ef5f185 and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.6.1"

  on_arm do
    sha256 "d07292d6b41e36e2081989d029ead2fc947261e2c854e3c330934d62d528dc52"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "556e76f1e07bcb7b4ba8f685cce1e09177d63f95e4c92818b0acca1b4ef5f185"
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
