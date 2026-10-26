class Dots < Formula
  desc "Cross-platform dotfiles manager, backup engine and machine provisioner"
  homepage "https://github.com/kevnnard/dots"
  head "https://github.com/kevnnard/dots.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/dots"
    bin.install_symlink "dots" => "kevnnard-dots"
  end

  test do
    assert_match "dots", shell_output("#{bin}/dots --help")
  end
end
