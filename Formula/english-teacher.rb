class EnglishTeacher < Formula
  desc "Personal English teacher in the terminal: spaced review, reading, writing, role-plays"
  homepage "https://github.com/kevnnard/english-teacher"
  url "https://codeload.github.com/kevnnard/english-teacher/tar.gz/refs/tags/v0.3.0"
  version "0.3.0"
  sha256 "a2dc7a09e64048a9c7c7d65267a779940a8d39cd904bfb85ed44933534514f1f"
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

      Audio is optional and runs locally: Listen, Pairs, Speak and Talk by
      voice need Piper (`uv tool install piper-tts`, then `teacher setup voice`);
      Speak and Talk by voice also need whisper.cpp (`brew install whisper-cpp`,
      then `teacher setup whisper`). `teacher doctor` shows what is found.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/teacher --version")
  end
end
