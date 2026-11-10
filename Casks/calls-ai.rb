cask "calls-ai" do
  version "0.1.1"
  sha256 "a17bafe48d9b69d8908543b8deb4ec3f9482ac64149322dee305961ca4ea8323"

  url "https://github.com/kevnnard/calls-ai/releases/download/v#{version}/CallsAI.zip"
  name "Calls AI"
  desc "Live Spanish translation and reply suggestions for English calls"
  homepage "https://github.com/kevnnard/calls-ai"

  depends_on macos: ">= :sonoma"

  app "CallsAI.app"

  zap trash: [
    "~/Library/Application Support/CallsAI",
  ]
end
