require "macho"

class Aoclb < Formula
  desc "Advent of Code Leaderboard CLI"
  homepage "https://github.com/dfribley/advent-of-code-leaderboard"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.4/aoclb-osx-x64.tar.gz"
    sha256 "4abec85802dd74842040b876f17ba4420b4319967f0869354f6adbf6b52e9fcf"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.4/aoclb-osx-arm64.tar.gz"
    sha256 "477acc872d5642c28be0b7cc7a84468682cf08ec4186e627c24fe9ce7b625ff1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.4/aoclb-linux-x64.tar.gz"
    sha256 "8e32df52036aa660790a38e5a424b6166a044b7028603650b0cde6b958aade75"
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
