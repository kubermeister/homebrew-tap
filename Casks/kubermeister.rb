# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.7.0, 646dbb733695382b0b19e9d507899ccfc0f5edf9581c7df7adff71246334e57e and 6224ce50d4f29ab5bb4efa0aec9c8a2449baefbf641d9064faa01e93c8c8f48c and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.7.0"

  on_arm do
    sha256 "646dbb733695382b0b19e9d507899ccfc0f5edf9581c7df7adff71246334e57e"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "6224ce50d4f29ab5bb4efa0aec9c8a2449baefbf641d9064faa01e93c8c8f48c"
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
