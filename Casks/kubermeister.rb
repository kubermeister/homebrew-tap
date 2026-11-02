# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 1.0.0, aab6902ea19dddbe2bcdd7719b43c76abe4810663ecb35135cc9153bec7c214a and 0489f5530b66604238aa9284d64a0659453ba436eb91d1a71307ddac984a6235 and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "1.0.0"

  on_arm do
    sha256 "aab6902ea19dddbe2bcdd7719b43c76abe4810663ecb35135cc9153bec7c214a"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "0489f5530b66604238aa9284d64a0659453ba436eb91d1a71307ddac984a6235"
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
