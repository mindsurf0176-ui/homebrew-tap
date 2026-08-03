class Relaycode < Formula
  desc "Mobile-first private remote control for local Codex development"
  homepage "https://github.com/mindsurf0176-ui/relaycode"
  url "https://github.com/mindsurf0176-ui/relaycode/releases/download/v0.2.0/relaycode-v0.2.0.tar.gz"
  sha256 "7b459b27e842f8e9b410b8e92f4f41235df911da2ffef91853e66986116f1fae"
  license "Apache-2.0"

  depends_on :macos
  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/relaycode"
  end

  service do
    run [opt_bin/"relaycode", "serve"]
    keep_alive true
    log_path var/"log/relaycode.log"
    error_log_path var/"log/relaycode.log"
    environment_variables PATH: std_service_path_env
  end

  test do
    assert_match "RelayCode 0.2.0", shell_output("#{bin}/relaycode --version")
  end
end
