# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.4.8, 236ad5ac21f5eb0f3d22603f08b22fc83567677dfc18627314923a2c4a518f91 and 89be8f6f74a095fff70a04ab3ce793479adf55e501ab1a3cccdf23b7c78bd7e3 and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.4.8"

  on_arm do
    sha256 "236ad5ac21f5eb0f3d22603f08b22fc83567677dfc18627314923a2c4a518f91"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "89be8f6f74a095fff70a04ab3ce793479adf55e501ab1a3cccdf23b7c78bd7e3"
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
