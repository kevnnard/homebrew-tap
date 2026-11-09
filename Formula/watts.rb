class Watts < Formula
  desc "Terminal dashboard for the power use and electricity bill of your devices"
  homepage "https://github.com/kevnnard/watts"
  url "https://codeload.github.com/kevnnard/watts/tar.gz/refs/tags/v0.3.0"
  version "0.3.0"
  sha256 "aa8349b72ded85ad13b1be67ced6e3b34b904e855790a21ac42af59a2236534a"
  license "PolyForm-Strict-1.0.0"
  head "https://github.com/kevnnard/watts.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/watts"
  end

  def caveats
    <<~EOS
      Start the background recorder with:
        watts install
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/watts version")
  end
end
