# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.4.5, ee886b5bb51daac8566893b12337c0e884ac62f0ff6b4d481f0a479b4e7a5949 and ee987a2f4fda447d6240ae4a0f6689d3bfecf27b5e0a6813288240f3776d00ac and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.4.5"

  on_arm do
    sha256 "ee886b5bb51daac8566893b12337c0e884ac62f0ff6b4d481f0a479b4e7a5949"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "ee987a2f4fda447d6240ae4a0f6689d3bfecf27b5e0a6813288240f3776d00ac"
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
