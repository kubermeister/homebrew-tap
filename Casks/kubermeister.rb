# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.9.1, 50dec903de981ef56d7dd23b04d6a5aff888ffa350425efa64a410dba79a272b and e628a9dff8cd75675799839eb431d43c22b4e3c14fb1aaaf07f42d3a3ecb63ff and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.9.1"

  on_arm do
    sha256 "50dec903de981ef56d7dd23b04d6a5aff888ffa350425efa64a410dba79a272b"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "e628a9dff8cd75675799839eb431d43c22b4e3c14fb1aaaf07f42d3a3ecb63ff"
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
