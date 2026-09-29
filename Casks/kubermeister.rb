# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.9.0, fe5b9954cf2c00a182afc2ae302d272bd07705ea9257b53c53f5851502dbb336 and 023bf66eddc3d3dd88a0912dca3f9c3dee28ec548ccffb31a17f2043b96be387 and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.9.0"

  on_arm do
    sha256 "fe5b9954cf2c00a182afc2ae302d272bd07705ea9257b53c53f5851502dbb336"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "023bf66eddc3d3dd88a0912dca3f9c3dee28ec548ccffb31a17f2043b96be387"
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
