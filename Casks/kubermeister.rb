# Template for the stable cask in kubermeister/homebrew-tap. The release workflow substitutes
# 0.9.5, 7adcb7df1528754d9b89eacbb18be2e4a669a43f865db34d55dbf4c198f6fba9 and 2f5770f6973d0a641a2a477298922c05aa561b087486216e11d5b374358374e8 and pushes the result as Casks/kubermeister.rb on
# every stable release. The dmg URLs depend on the artifactName pattern in electron-builder.yml.
cask "kubermeister" do
  version "0.9.5"

  on_arm do
    sha256 "7adcb7df1528754d9b89eacbb18be2e4a669a43f865db34d55dbf4c198f6fba9"
    url "https://github.com/kubermeister/kubermeister/releases/download/v#{version}/Kubermeister-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "2f5770f6973d0a641a2a477298922c05aa561b087486216e11d5b374358374e8"
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
