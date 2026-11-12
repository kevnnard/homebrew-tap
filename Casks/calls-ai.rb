cask "calls-ai" do
  version "0.1.4"
  sha256 "cc54176de54402539f1bc15101f2a0d2803be8c79de63d54f0a72913058bdad7"

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
