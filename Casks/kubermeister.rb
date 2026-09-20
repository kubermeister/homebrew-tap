# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.4.4, 76b7a3529e2844ff573281faaddcf6a37007caa8ded22ef3a933a389e9513c34 and d096ba542fd1164379495fb5ba28e0958229689e49c05c5ec8d6495acaad631f and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.4.4"

  on_arm do
    sha256 "76b7a3529e2844ff573281faaddcf6a37007caa8ded22ef3a933a389e9513c34"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "d096ba542fd1164379495fb5ba28e0958229689e49c05c5ec8d6495acaad631f"
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
