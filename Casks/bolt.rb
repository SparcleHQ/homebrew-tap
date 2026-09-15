cask "bolt" do
  version "0.1.162"
  sha256 arm:   "861050bda11be4a606d31bd9e0eee91dfeb0152814b346c8a6130d7295049c70",
         intel: "530a4a868bd604dfce177a046c01101eaf9495ebbf0c8f9c38c62b2fdb57bd76"

  url "https://github.com/SparcleHQ/sparcle.app/releases/download/v#{version}/Bolt-Enterprise-#{version}-#{Hardware::CPU.arm? ? "aarch64" : "x86_64"}-apple-darwin.dmg"
  name "Bolt"
  desc "Local-first AI workspace with governed data egress"
  homepage "https://sparcle.app/"

  # Bolt ships a Tauri updater and updates itself in place. Without this, Homebrew treats a
  # self-updated app as drift and `brew upgrade` reinstalls over it — two updaters fighting
  # over the same bundle, which is how a working install ends up half-replaced.
  auto_updates true

  app "Bolt.app"

  # The bundle used to be called "Bolt Enterprise.app". Homebrew only knows how to remove the
  # artifact the INSTALLED cask declared, so on the upgrade that crosses the rename the old
  # bundle can be left in /Applications — a second, older Bolt that still auto-launches and
  # fights the new one over port 13018. Naming it here removes it. `trash:` rather than
  # `delete:`: the cookbook calls delete a last resort, and trashing is reversible and needs
  # no sudo. Drop this once no installed cask can still be on the old name.
  uninstall trash: "/Applications/Bolt Enterprise.app"

  zap trash: [
    "/Applications/Bolt Enterprise.app",
    "~/Library/Application Support/app.sparcle.bolt.enterprise",
    "~/Library/Caches/app.sparcle.bolt.enterprise",
  ]
end
