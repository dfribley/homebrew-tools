class Aoclb < Formula
  desc "Advent of Code Leaderboard CLI"
  homepage "https://github.com/dfribley/advent-of-code-leaderboard"
  version "1.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.0/aoclb-osx-x64.tar.gz"
    sha256 "7b2fc976a78b2d5b9c846790b0f62c2ac779da2fc0e1a3b9cc455113944e8dae"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.0/aoclb-osx-arm64.tar.gz"
    sha256 "32767ed4d4463e5895f1c187e1304e812a19b08a60df4725a866b2afaff55684"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.0/aoclb-linux-x64.tar.gz"
    sha256 "329a15f3597c346a1ef9e343e30c826944ad6d352a471342f02fa6e938a28f37"
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
