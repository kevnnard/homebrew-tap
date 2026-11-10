class EnglishTeacher < Formula
  desc "Personal English teacher in the terminal: spaced review, reading, writing, role-plays"
  homepage "https://github.com/kevnnard/english-teacher"
  url "https://codeload.github.com/kevnnard/english-teacher/tar.gz/refs/tags/v0.1.0"
  version "0.1.0"
  sha256 "19152e9f56eb464856c009c0b01a4abd36768c9e4f26f3bdbd7ffc380dc806a2"
  license "PolyForm-Strict-1.0.0"
  head "https://github.com/kevnnard/english-teacher.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:, output: bin/"teacher"), "./cmd/teacher"
  end

  def caveats
    <<~EOS
      Review, Fluency and the vocabulary quiz work offline.
      Learn, Write, Talk and the grammar quiz use the `pi` CLI (Gentle Shell);
      see `teacher models`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/teacher --version")
  end
end
