# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.3.0, bbce4cdc71febd6a83d3b60d80f1045439f2fc59c5357fdd25f4f85f870c2617 and 1cd97bfb490c953181cc9931616b446ab3836bba9ebf9cd7a29963b0487a1877 and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.3.0"

  on_arm do
    sha256 "bbce4cdc71febd6a83d3b60d80f1045439f2fc59c5357fdd25f4f85f870c2617"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "1cd97bfb490c953181cc9931616b446ab3836bba9ebf9cd7a29963b0487a1877"
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
