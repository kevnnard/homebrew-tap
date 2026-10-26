cask "smartwindow" do
  version "0.3.0"
  sha256 "781dee9ad8d531503b14b9ae8ad7cc7671cb21a98381985df9a5f9246a35ef93"

  url "https://github.com/kevnnard/smart-window/releases/download/v#{version}/SmartWindow.zip"
  name "SmartWindow"
  desc "Polybar-style macOS top bar with numbered window tabs"
  homepage "https://github.com/kevnnard/smart-window"

  app "SmartWindow.app"

  zap trash: [
    "~/Library/Application Support/SmartWindow",
    "~/Library/Preferences/com.kevnnard.smartwindow.plist",
  ]
end
