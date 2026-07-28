cask "bolt" do
  version "0.1.141"
  sha256 arm:   "bc7cd0e1c95e4bc69fa7b021d1d5786e5774d6ab0fd565e6c0683ce2c703121c",
         intel: "f4bb01e15f7b5e24f252981574b87a70bb30829cc6167f9ad0991e883ad85a15"

  url "https://github.com/SparcleHQ/sparcle.app/releases/download/v0.1.141/Bolt-Enterprise-#{version}-#{Hardware::CPU.arm? ? "aarch64" : "x86_64"}-apple-darwin.dmg"
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
