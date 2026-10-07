# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.10.0, 609940d08870657a80cf1e5de41358aaeb36017b88cc5b20bb15007a60e2ad12 and c5fecac8f20dcae1c72a0a1e1a218ee30b3c430addaf6bf8ae1c77de008d430d and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.10.0"

  on_arm do
    sha256 "609940d08870657a80cf1e5de41358aaeb36017b88cc5b20bb15007a60e2ad12"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "c5fecac8f20dcae1c72a0a1e1a218ee30b3c430addaf6bf8ae1c77de008d430d"
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
