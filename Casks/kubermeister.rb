# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.8.0, 137c7234b8ae0fddb0beb6bccea259b91bd7b85f0d5a5300e3a4baf2428ed9ff and 3e33a673a8ca0213478f7000071e679c62353f07aae289c21e3359ada8d4be09 and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.8.0"

  on_arm do
    sha256 "137c7234b8ae0fddb0beb6bccea259b91bd7b85f0d5a5300e3a4baf2428ed9ff"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "3e33a673a8ca0213478f7000071e679c62353f07aae289c21e3359ada8d4be09"
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
