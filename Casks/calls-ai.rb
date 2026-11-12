cask "calls-ai" do
  version "0.1.5"
  sha256 "1a94659be78b563b823a3039822ea513810d4fd4bf827758be461e07b16d2f55"

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
