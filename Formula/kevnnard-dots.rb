class KevnnardDots < Formula
  desc "Cross-platform dotfiles manager, backup engine and machine provisioner"
  homepage "https://github.com/kevnnard/dots"
  url "https://codeload.github.com/kevnnard/dots/tar.gz/refs/tags/v1.5.1"
  version "1.5.1"
  sha256 "91e64bef4fbd7f7cc2117faf827dc877480fa4c3ae370937b42b73cc422a2017"
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
