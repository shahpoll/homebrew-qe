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

  def caveats
    <<~EOS
      qe-apple-silicon-build is now installed. To install Quantum ESPRESSO, run:

        qe-apple-silicon-build install --qe-tag qe-7.5 --install-prefix "$HOME/opt/qe-7.5"

      Or use the interactive menu:

        qe-apple-silicon-build menu

      After installation, validate your build with:

        qe-apple-silicon-build check --qe-bin "$HOME/opt/qe-7.5/bin"

      For full documentation, see:
        https://github.com/shahpoll/qe_apple_silicon_build

      Tip: short alias install (if enabled in this tap):
        brew install shahpoll/qe/qe
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/qe-apple-silicon-build help")
  end
end
