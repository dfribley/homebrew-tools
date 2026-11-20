require "macho"

class Aoclb < Formula
  desc "Advent of Code Leaderboard CLI"
  homepage "https://github.com/dfribley/advent-of-code-leaderboard"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.1/aoclb-osx-x64.tar.gz"
    sha256 "6a0ab7f8fad77ad7668ee1f484fbb38e71be439dbe76222adb32bd9eeea5afaa"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.1/aoclb-osx-arm64.tar.gz"
    sha256 "fa09858d095ae80cd94f70538f60e02a9b969cec8a2f6a0c0802a5a97ab4887e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.1/aoclb-linux-x64.tar.gz"
    sha256 "c1af7840621ace69eb9ba23446f2701c0ed031f2bf2bc45969f0b26b5a20f2ec"
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
