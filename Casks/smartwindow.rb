cask "smartwindow" do
  version "0.5.0"
  sha256 "7aaca41f718477abaf598085688951eb7c00b32255fd855ea9eb6af5d54eb853"

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
