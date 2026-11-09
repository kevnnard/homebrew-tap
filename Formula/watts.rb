class Watts < Formula
  desc "Terminal dashboard for the power use and electricity bill of your devices"
  homepage "https://github.com/kevnnard/watts"
  url "https://codeload.github.com/kevnnard/watts/tar.gz/refs/tags/v0.2.0"
  version "0.2.0"
  sha256 "87bbbfbfe698862b6213663b5b07bb21e13ba514e7f6ace55c4900494c3ce0f1"
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
