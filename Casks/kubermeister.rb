# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.4.3, a04cfe87f67e5a2f19a785a5c2bd44eb6481ce8d4254db954c5d0bd5996473d4 and b040b730998847babcec30fe1c1d2798402d1cb7695655baa2638622391ae1e3 and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.4.3"

  on_arm do
    sha256 "a04cfe87f67e5a2f19a785a5c2bd44eb6481ce8d4254db954c5d0bd5996473d4"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "b040b730998847babcec30fe1c1d2798402d1cb7695655baa2638622391ae1e3"
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
