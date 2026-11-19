cask "futjesus-hub" do
  version "0.1.1"
  sha256 "46132466df0a37a6378717f49aa343fbce3fc049f90fa79aea7bcb484504f9e8"

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
