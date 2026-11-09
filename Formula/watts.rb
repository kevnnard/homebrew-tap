class Watts < Formula
  desc "Terminal dashboard for the power use and electricity bill of your devices"
  homepage "https://github.com/kevnnard/watts"
  url "https://codeload.github.com/kevnnard/watts/tar.gz/refs/tags/v0.1.0"
  version "0.1.0"
  sha256 "4b160360114fe84654a7ddee8aebb5cb51d27167a61125cd76e44ea50d38d087"
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
