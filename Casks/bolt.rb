cask "bolt" do
  version "0.1.150"
  sha256 arm:   "bedf5ef0b7e4e45165ba12213ab10347034aaa3077fbe8706f481699f479df6c",
         intel: "4826b48181f39b449e551360c0df919d5493cfeafa2c0804e6a135616c8607de"

  url "https://github.com/SparcleHQ/sparcle.app/releases/download/v0.1.150/Bolt-Enterprise-#{version}-#{Hardware::CPU.arm? ? "aarch64" : "x86_64"}-apple-darwin.dmg"
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
