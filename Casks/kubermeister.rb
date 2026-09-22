# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.5.0, 193a2325ded401bb37e51e8146e6721b3cd30896567e8ac160bcd0bab99b9fc4 and 27cb7c524af8017fe4db16ca2e277af7a4d35ac1dc9672c264ca3fa7cf49c84f and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.5.0"

  on_arm do
    sha256 "193a2325ded401bb37e51e8146e6721b3cd30896567e8ac160bcd0bab99b9fc4"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "27cb7c524af8017fe4db16ca2e277af7a4d35ac1dc9672c264ca3fa7cf49c84f"
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
