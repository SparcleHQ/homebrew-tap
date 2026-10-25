cask "bolt" do
  version "0.1.176"
  sha256 arm:   "1f9f2ef6509c18c86bcfea0d7f2df80eb732fd78c9cb777748c36528410f0f30",
         intel: "92a8cb1bb44d4b50c8060d5c14996ed3157095235607d67568e13b864b70a5cc"

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
