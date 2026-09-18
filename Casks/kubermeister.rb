# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.4.2, 783e88c2e11145e4ab9b296ee7ab4e3dd4924ce73933eafab0b613cd6dc9f07b and 382dc443dfd3d4948e25f845c1d648396bf3f27d7c33ef2c1c9283a278926d48 and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.4.2"

  on_arm do
    sha256 "783e88c2e11145e4ab9b296ee7ab4e3dd4924ce73933eafab0b613cd6dc9f07b"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "382dc443dfd3d4948e25f845c1d648396bf3f27d7c33ef2c1c9283a278926d48"
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
