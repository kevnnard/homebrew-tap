cask "calls-ai" do
  version "0.1.7"
  sha256 "a55d75ce5ad7748b8e3f2db245f40d0d8c975a8f1e67276bab47f732c67f9db6"

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
