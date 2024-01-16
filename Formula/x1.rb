class X1 < Formula
  desc "X1 blockchain protocol secured by the Lachesis consensus algorithm"
  homepage "https://xen.network"
  license "LGPL-3.0"
  url "https://github.com/FairCrypto/go-x1/archive/refs/tags/v0.9.0-1.tar.gz"
  sha256 "b230495c3fdd2d6ebed92ac8b833acb3cd62a949b5decf7b8330718468fb8f50"

  depends_on "go" => :build
  depends_on "make" => :build

  def install
    system "make", "x1"
    bin.install Dir["build/*"]
  end

  test do
    system "false"
  end
end
