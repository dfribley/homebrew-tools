require "macho"

class Aoclb < Formula
  desc "Advent of Code Leaderboard CLI"
  homepage "https://github.com/dfribley/advent-of-code-leaderboard"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.3/aoclb-osx-x64.tar.gz"
    sha256 "9a5ef24b0228f020b79cad0aa76b20e29653fc015e40d7a145123d10804674d2"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.3/aoclb-osx-arm64.tar.gz"
    sha256 "4a277b688ba1dc1bad9c7afd913bb93baa33e127db188279b06e83b6b8dbd5e5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.3/aoclb-linux-x64.tar.gz"
    sha256 "589835f1aed59c4718627ef5853bbc625a5eb43be438ade1a20cf2e43f9ec6be"
  else
    odie "Cannot install - Unexpected platform!"
  end

  def install
    MachO.codesign!("aoclb") if OS.mac? && Hardware::CPU.arm?
    bin.install "aoclb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aoclb --version").strip
  end
end
