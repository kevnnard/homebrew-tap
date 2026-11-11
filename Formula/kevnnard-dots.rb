class KevnnardDots < Formula
  desc "Cross-platform dotfiles manager, backup engine and machine provisioner"
  homepage "https://github.com/kevnnard/dots"
  url "https://codeload.github.com/kevnnard/dots/tar.gz/refs/tags/v1.8.0"
  version "1.8.0"
  sha256 "735aee7a77ef1d54cabcd3c0cb17fc1f2bd130a2f31732b61aa7b4c2f464953f"
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
