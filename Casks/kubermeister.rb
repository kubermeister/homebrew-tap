# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.9.3, c5588f4ae9d543723fae7ec11b6118fb02d61cf54cfab1341b60f2234f80ffdb and 0125c7c3f769609335402a5abec0c3ff2c5dced4cc9fdb8073cc26d981f4b3b7 and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.9.3"

  on_arm do
    sha256 "c5588f4ae9d543723fae7ec11b6118fb02d61cf54cfab1341b60f2234f80ffdb"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "0125c7c3f769609335402a5abec0c3ff2c5dced4cc9fdb8073cc26d981f4b3b7"
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
