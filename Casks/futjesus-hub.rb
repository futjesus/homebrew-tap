cask "futjesus-hub" do
  version "0.1.0"
  sha256 "dfe07f1761504c9fba2a2e98b8dbd0d32dfb2a17dd64b44d8018d5718697d120"

  url "https://github.com/futjesus/futjesus-hub/releases/download/v#{version}/Futjesus-Hub-#{version}.zip"
  name "Futjesus Hub"
  desc "Multiple Gmail accounts in one window"
  homepage "https://github.com/futjesus/futjesus-hub"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Futjesus Hub.app"

  # The app is not notarized, so Gatekeeper would refuse to open it.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Futjesus Hub.app"]
  end

  uninstall quit: "com.futjesus.hub"

  zap trash: [
    "~/Library/Application Support/com.futjesus.hub",
    "~/Library/Caches/com.futjesus.hub",
    "~/Library/WebKit/com.futjesus.hub",
  ]
end
