class Aoclb < Formula
  desc "Advent of Code Leaderboard CLI"
  homepage "https://github.com/dfribley/advent-of-code-leaderboard"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.1.0/aoclb-osx-x64.tar.gz"
    sha256 "dfe292502ccf43d0695e310b61a2f6540433c763dcb5d5b59183377f9c1f539f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.1.0/aoclb-osx-arm64.tar.gz"
    sha256 "4275f1de14a151967cc5599a49eeb7d6838811687b3ab55dc02603a7eed60880"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.1.0/aoclb-linux-x64.tar.gz"
    sha256 "061266b0559527c01bd2698bd799e9ac9ff43f129a6574e1dd13c94bb3c244a9"
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