cask "bolt" do
  version "0.1.143"
  sha256 arm:   "6aadc248155c99402531b179080146e8eacd5f59c5b52d733a44842db8264b52",
         intel: "d73442ed92c75f15085fa35041b30fd05ac1b3f2182b060f92dd208831dfb372"

  url "https://github.com/SparcleHQ/sparcle.app/releases/download/v0.1.143/Bolt-Enterprise-#{version}-#{Hardware::CPU.arm? ? "aarch64" : "x86_64"}-apple-darwin.dmg"
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
