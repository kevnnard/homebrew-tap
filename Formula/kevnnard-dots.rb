class KevnnardDots < Formula
  desc "Cross-platform dotfiles manager, backup engine and machine provisioner"
  homepage "https://github.com/kevnnard/dots"
  url "https://codeload.github.com/kevnnard/dots/tar.gz/refs/tags/v1.9.0"
  version "1.9.0"
  sha256 "208654124ed929fb8d16d131cd242788f1ac4e7915b3f8675b72ae27c825b92e"
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
