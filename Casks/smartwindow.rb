cask "smartwindow" do
  version "0.8.1"
  sha256 "1450fcdf3add2cae529d0ad762f7814390aa60d9f17521bcef4b548fe8860473"

  url "https://github.com/kevnnard/smart-window/releases/download/v#{version}/SmartWindow.zip"
  name "SmartWindow"
  desc "Polybar-style macOS top bar with numbered window tabs"
  homepage "https://github.com/kevnnard/smart-window"

  auto_updates true

  app "SmartWindow.app"

  zap trash: [
    "~/Library/Application Support/SmartWindow",
    "~/Library/Preferences/com.kevnnard.smartwindow.plist",
  ]
end
