class QeAppleSiliconBuild < Formula
  desc "One-command installer/updater and migration validator for QE on Apple Silicon"
  homepage "https://github.com/shahpoll/qe_apple_silicon_build"
  url "https://github.com/shahpoll/qe_apple_silicon_build/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "97c311f415cae3b6ef7edb60188794a35d62894efa0a8c2f1cbfb42cb6fc12c3"
  license "MIT"
  head "https://github.com/shahpoll/qe_apple_silicon_build.git", branch: "main"

  depends_on "python@3.13"
  depends_on "open-mpi"
  depends_on "gcc"
  depends_on "cmake"
  depends_on "veclibfort"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/qe-apple-silicon-build"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/qe-apple-silicon-build help")
  end
end
