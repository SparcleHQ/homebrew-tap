cask "bolt" do
  version "0.1.147"
  sha256 arm:   "12861a2ac6d1d820dc4c758f46fefced82c474ec070d726eb369057a2916664c",
         intel: "6285e2c65a3b79d9ceb4d054e938acb20ce500f119e695e8395e049556be236f"

  url "https://github.com/SparcleHQ/sparcle.app/releases/download/v0.1.147/Bolt-Enterprise-#{version}-#{Hardware::CPU.arm? ? "aarch64" : "x86_64"}-apple-darwin.dmg"
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
