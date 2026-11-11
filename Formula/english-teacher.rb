class EnglishTeacher < Formula
  desc "Personal English teacher in the terminal: spaced review, reading, writing, role-plays"
  homepage "https://github.com/kevnnard/english-teacher"
  url "https://codeload.github.com/kevnnard/english-teacher/tar.gz/refs/tags/v0.4.0"
  version "0.4.0"
  sha256 "54243f39ded7836607e4807cfe5b53e9c249677a39b4306fd6af9f8718506bdf"
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
