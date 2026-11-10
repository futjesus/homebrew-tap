cask "tiler" do
  version "1.0.0"
  sha256 "25d7b83286aab42448fb4a5a4e95699c1386417894a63d3959262a39395172c8"

  url "https://github.com/futjesus/tiler/releases/download/v#{version}/Tiler-#{version}.zip"
  name "Tiler"
  desc "Move and resize windows with keyboard shortcuts"
  homepage "https://github.com/futjesus/tiler"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Tiler.app"

  # The app is not notarized, so Gatekeeper would refuse to open it.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Tiler.app"]
  end

  uninstall quit: "com.futjesus.Tiler"

  zap trash: "~/Library/Preferences/com.futjesus.Tiler.plist"
end
