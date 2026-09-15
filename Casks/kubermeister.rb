# Template for the stable cask in araratpoghosyan/homebrew-tap. The release workflow substitutes
# 0.1.1, d8d78bd057e6f7e3cb88d98d4c2faa7f54c425868ef2b2e834dfa0bc85ccfdf9 and 8bbfee9ef44f89bb459e663303262e49a17a3d9adc5a19d2aef2283ffc6dca7b and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.1.1"

  on_arm do
    sha256 "d8d78bd057e6f7e3cb88d98d4c2faa7f54c425868ef2b2e834dfa0bc85ccfdf9"
    url "https://github.com/araratpoghosyan/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "8bbfee9ef44f89bb459e663303262e49a17a3d9adc5a19d2aef2283ffc6dca7b"
    url "https://github.com/araratpoghosyan/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-x64.dmg"
  end

  name "Kubermeister"
  desc "Desktop Kubernetes client"
  homepage "https://github.com/araratpoghosyan/kubermeister"

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
