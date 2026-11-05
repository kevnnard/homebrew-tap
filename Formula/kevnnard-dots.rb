class KevnnardDots < Formula
  desc "Cross-platform dotfiles manager, backup engine and machine provisioner"
  homepage "https://github.com/kevnnard/dots"
  url "https://codeload.github.com/kevnnard/dots/tar.gz/refs/tags/v1.4.2"
  version "1.4.2"
  sha256 "c966e244e0dc1f15206b45cf1ad9f0847de57024300ee46a6af924735834a6ab"
  head "https://github.com/kevnnard/dots.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/dots"
    bin.install_symlink "dots" => "kevnnard-dots"
  end

  test do
    assert_match "kevnnard-dots", shell_output("#{bin}/kevnnard-dots --help")
  end
end
