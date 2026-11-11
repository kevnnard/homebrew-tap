class Devtrainer < Formula
  desc "Terminal trainer for programming, architecture and tooling with spaced repetition"
  homepage "https://github.com/kevnnard/devtrainer"
  url "https://codeload.github.com/kevnnard/devtrainer/tar.gz/refs/tags/v0.1.0"
  version "0.1.0"
  sha256 "e711e0db3c7168a0da436597d232857ac998a6f87a6d7b6b8492f3298920924d"
  # PolyForm Strict License 1.0.0 (not on the SPDX list); see LICENSE and
  # https://polyformproject.org/licenses/strict/1.0.0
  license :cannot_represent

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/devtrainer"
  end

  test do
    assert_equal "devtrainer #{version}\n", shell_output("#{bin}/devtrainer --version")

    # validate reads only the embedded content; it must not create a database.
    ENV["XDG_DATA_HOME"] = (testpath/"data").to_s
    ENV["XDG_CONFIG_HOME"] = (testpath/"config").to_s
    assert_match "Content OK", shell_output("#{bin}/devtrainer validate")
    refute_path_exists testpath/"data/devtrainer/devtrainer.db"
  end
end
