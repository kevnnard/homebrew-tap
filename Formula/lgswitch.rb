class Lgswitch < Formula
  desc "Switch an LG ultrawide's input (Mac, Linux PC, PS5) and the Mac's sound output"
  homepage "https://github.com/kevnnard/lgswitch"
  url "https://codeload.github.com/kevnnard/lgswitch/tar.gz/refs/tags/v0.2.0"
  version "0.2.0"
  sha256 "e41b39ca01b401a6efd14b8ce4ea580e21a5c7b8e137857928761a474407508d"
  license "PolyForm-Strict-1.0.0"
  head "https://github.com/kevnnard/lgswitch.git", branch: "main"

  depends_on "go" => :build

  def install
    # The macOS hotkey daemon (`lgswitch daemon`) uses Carbon and
    # `lgswitch audio` uses CoreAudio, both through cgo.
    # Linux needs no cgo.
    ENV["CGO_ENABLED"] = OS.mac? ? "1" : "0"
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/lgswitch"
  end

  def caveats
    s = ""
    if OS.mac?
      s += <<~EOS
        lgswitch switches the monitor with m1ddc. Install it with:
          brew install m1ddc

        Start the hotkey daemon (Cmd+F1/F2/F3 monitor,
        Cmd+Opt+F1-F4 audio) at login with:
          lgswitch install
      EOS
    else
      s += <<~EOS
        lgswitch switches the monitor with ddcutil. Install it with your
        package manager, and make sure your user can open /dev/i2c-*
        (for example: add yourself to the i2c group and load i2c-dev).

        Print the Hyprland SUPER + F1/F2/F3 binds with:
          lgswitch install
      EOS
    end
    s
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lgswitch version")
  end
end
