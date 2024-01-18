class X1 < Formula
  desc "X1 blockchain protocol secured by the Lachesis consensus algorithm"
  homepage "https://xen.network"
  license "LGPL-3.0"
  url "https://github.com/FairCrypto/go-x1/archive/refs/tags/v0.9.0-4.tar.gz"
  sha256 "ca4e1332035c6b19f3f8c2eaec0b197462a5e7a4c1768e345b31378f18ca9022"

  depends_on "go" => :build
  depends_on "make" => :build

  service do
    run [opt_bin/"x1", "--config", "#{etc}/x1/config.toml"]
    keep_alive true
    environment_variables PATH: HOMEBREW_PREFIX/"bin"
    log_path var/"log/x1.log"
    error_log_path var/"log/x1.log"
  end

  def install
    system "make", "x1"
    bin.install Dir["build/*"]
    mkdir_p "#{etc}/x1"
    etc.install "system/etc/x1/config.toml" => "x1/config.toml"
    mkdir_p "#{share}/x1/configs/testnet"
    share.install "system/usr/share/x1/configs/testnet/api-node.toml" => "x1/configs/testnet/api-node.toml"
    share.install "system/usr/share/x1/configs/testnet/full-node.toml" => "x1/configs/testnet/full-node.toml"
    share.install "system/usr/share/x1/configs/testnet/archive-node.toml" => "x1/configs/testnet/archive-node.toml"
    share.install "system/usr/share/x1/configs/testnet/validator-node.toml" => "x1/configs/testnet/validator-node.toml"
  end

  test do
    system "false"
  end
end
