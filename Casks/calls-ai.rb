cask "calls-ai" do
  version "0.1.2"
  sha256 "88ab22b218c50c230770ca846271e15f026851feff4bfd3d9eb84d5d0215808e"

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
