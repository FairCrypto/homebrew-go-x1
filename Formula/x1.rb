class X1 < Formula
  desc "Official Go implementation of the X1 protocol"
  homepage "https://xen.network"
  url "https://github.com/FairCrypto/go-x1/archive/refs/tags/v1.1.5-rc.5.tar.gz"
  sha256 "af9d6d03823dd3f0d8807448ccf2f06dcfd2fa3236bad2b6f8d631738bfe1f51"
  license "LGPL-3.0"

  depends_on "go" => :build
  depends_on "make" => :build

  service do
    run [opt_bin / "x1", "--config", "#{etc}/x1/config.toml"]
    keep_alive true
    environment_variables PATH: HOMEBREW_PREFIX / "bin"
    log_path var / "log/x1.log"
    error_log_path var / "log/x1.log"
  end

  def install
    system "make", "x1"
    bin.install Dir["build/*"]
    mkdir_p "#{etc}/x1"
    etc.install "system/etc/x1/config.toml" => "x1/config.toml"
    mkdir_p "#{share}/x1/configs/testnet"
    configs = "system/usr/share/x1/configs"
    share.install "#{configs}/testnet/api-node.toml"       => "x1/configs/testnet/api-node.toml"
    share.install "#{configs}/testnet/full-node.toml"      => "x1/configs/testnet/full-node.toml"
    share.install "#{configs}/testnet/archive-node.toml"   => "x1/configs/testnet/archive-node.toml"
    share.install "#{configs}/testnet/validator-node.toml" => "x1/configs/testnet/validator-node.toml"
  end

  test do
    system "false"
  end
end
