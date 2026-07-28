cask "bolt" do
  version "0.1.140"
  sha256 arm:   "e110ad90bccc5971b5446d97b94fd902843174c1493c3993842ad23ca8a66d20",
         intel: "dbd3d80dce8c3bec319694042a748f64eeed9fbb4e51d580b901a2e1e5695837"

  url "https://github.com/SparcleHQ/sparcle.app/releases/download/v0.1.140/Bolt-Enterprise-#{version}-#{Hardware::CPU.arm? ? "aarch64" : "x86_64"}-apple-darwin.dmg"
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
