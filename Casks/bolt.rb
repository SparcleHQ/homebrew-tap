cask "bolt" do
  version "0.1.141"
  sha256 arm:   "3d37fa88bba94b011bcbe24cdc572deca98239ae9b2724af9c3dd29021eaf5dc",
         intel: "0547dc284dd84484db3055d48a213827c3b62ed5a96820cb9d96fc76bab91e88"

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
