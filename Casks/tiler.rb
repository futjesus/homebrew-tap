cask "tiler" do
  version "1.0.2"
  sha256 "685dee6dfd2b58fda50abec61647a391d7b919098c8588d0467d85319d1e8cf2"

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
