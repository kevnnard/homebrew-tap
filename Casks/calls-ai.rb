cask "calls-ai" do
  version "0.1.6"
  sha256 "aa845859e4270bfd73c30104d5dada593b5d6960a8cfd2db1da40a28f8efd987"

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
