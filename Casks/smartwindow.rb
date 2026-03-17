cask "smartwindow" do
  version "0.2.2"
  sha256 "1e2e6e6d0552baeea8001c00dda1ba1a4163d494fbde84e9224459272c95bf17"

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
