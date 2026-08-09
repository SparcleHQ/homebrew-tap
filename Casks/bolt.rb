cask "bolt" do
  version "0.1.148"
  sha256 arm:   "e5e474c39fe6557944891a4bc77c46b8ff2a81643592c3946d84f29df1197ce6",
         intel: "59c8e05f4d4eab84c119af053fc2cec0347c4f1896a77213f3e21a6562a9adcf"

  url "https://github.com/SparcleHQ/sparcle.app/releases/download/v0.1.148/Bolt-Enterprise-#{version}-#{Hardware::CPU.arm? ? "aarch64" : "x86_64"}-apple-darwin.dmg"
  name "Bolt"
  desc "Local-first AI workspace with governed data egress"
  homepage "https://sparcle.app/"

  # Bolt ships a Tauri updater and updates itself in place. Without this, Homebrew treats a
  # self-updated app as drift and `brew upgrade` reinstalls over it — two updaters fighting
  # over the same bundle, which is how a working install ends up half-replaced.
  auto_updates true

  app "Bolt Enterprise.app"

  zap trash: [
    "~/Library/Application Support/app.sparcle.bolt.enterprise",
    "~/Library/Caches/app.sparcle.bolt.enterprise",
  ]
end
