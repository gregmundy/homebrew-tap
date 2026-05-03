class Llamavm < Formula
  desc "Version manager for llama.cpp on Apple Silicon"
  homepage "https://github.com/gregmundy/llamavm"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/gregmundy/llamavm/releases/download/v#{version}/llamavm_#{version}_darwin_arm64.tar.gz"
      sha256 "140826cfc43d119a734898d798a1b48d620084e68f1fd3b6217e6e2b0fb777d2"
    end
  end

  def install
    bin.install "llamavm"
    bin.install "llamavm-shim"
  end

  def caveats
    <<~EOS
      llamavm needs its shims directory on PATH. Add this to your shell rc:

        export PATH="$HOME/.llamavm/shims:$PATH"

      Then install a llama.cpp version:

        llamavm install latest
        llamavm doctor

    EOS
  end

  test do
    assert_match "llamavm version", shell_output("#{bin}/llamavm --version")
  end
end
