class KevnnardDots < Formula
  desc "Cross-platform dotfiles manager, backup engine and machine provisioner"
  homepage "https://github.com/kevnnard/dots"
  url "https://codeload.github.com/kevnnard/dots/tar.gz/refs/tags/v1.6.2"
  version "1.6.2"
  sha256 "21a16cbddcb0556eb7c6ff34c799eee9df4d653181958f3bcbfbe94a963b7ba7"
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
