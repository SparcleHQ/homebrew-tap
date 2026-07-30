cask "bolt" do
  version "0.1.142"
  sha256 arm:   "3f2eae475db771578e8d7584c9befc58ccca2854705848eaa17b1f19b58ea86f",
         intel: "TBD"

  url "https://github.com/SparcleHQ/sparcle.app/releases/download/v0.1.142/Bolt-Enterprise-#{version}-#{Hardware::CPU.arm? ? "aarch64" : "x86_64"}-apple-darwin.dmg"
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
