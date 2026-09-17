# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.2.0, 840a4f81b4046ac907f34cc57717c9fe972cdd19ef3f16a6b74c601b70f273d5 and ede0b8434b02caa2f30e77edf5a28efb6abcac590d98787600b219e81a54e136 and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.2.0"

  on_arm do
    sha256 "840a4f81b4046ac907f34cc57717c9fe972cdd19ef3f16a6b74c601b70f273d5"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "ede0b8434b02caa2f30e77edf5a28efb6abcac590d98787600b219e81a54e136"
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
