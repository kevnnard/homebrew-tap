cask "smartwindow" do
  version "0.1.3"
  sha256 "16b1b706546cf8ab5cab7bb2cfc58acd2377aa5ce98f1a381f7692b7c1ee4db0"

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
