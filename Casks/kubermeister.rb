# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.4.7, 41d3142188d567c006f34464352bf629b2760b793680b087cf6ca245af3fb619 and bc438c487797b994e6a1bf95793403a2aa049db598952fe0fe04e0153f7308e0 and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.4.7"

  on_arm do
    sha256 "41d3142188d567c006f34464352bf629b2760b793680b087cf6ca245af3fb619"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "bc438c487797b994e6a1bf95793403a2aa049db598952fe0fe04e0153f7308e0"
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
