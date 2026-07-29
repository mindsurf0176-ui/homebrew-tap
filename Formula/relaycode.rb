class Relaycode < Formula
  desc "Mobile-first private remote control for local Codex development"
  homepage "https://github.com/mindsurf0176-ui/relaycode"
  url "https://github.com/mindsurf0176-ui/relaycode/releases/download/v0.1.0/relaycode-v0.1.0.tar.gz"
  sha256 "d1c5dc631a591311f3df187fbaa8e548fb452a8bb10eb056e12b6c8b95f6b6b7"
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
    assert_match "RelayCode 0.1.0", shell_output("#{bin}/relaycode --version")
  end
end
