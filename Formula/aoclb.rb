require "macho"

class Aoclb < Formula
  desc "Advent of Code Leaderboard CLI"
  homepage "https://github.com/dfribley/advent-of-code-leaderboard"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.2/aoclb-osx-x64.tar.gz"
    sha256 "50f8ce1cd46c3feaa40a0186c126b48ecdf579b8e3e3fd123f44fbf09d707c3b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.2/aoclb-osx-arm64.tar.gz"
    sha256 "e161d5c583783fd312b414a23b71dedcfe5502fa3c579103729c5b3f03836c9d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.2/aoclb-linux-x64.tar.gz"
    sha256 "f81229e4e83ac844fd122708b413094c15b6788c6193941fc3e01129e8181066"
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
