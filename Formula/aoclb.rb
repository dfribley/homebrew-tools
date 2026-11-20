require "macho"

class Aoclb < Formula
  desc "Advent of Code Leaderboard CLI"
  homepage "https://github.com/dfribley/advent-of-code-leaderboard"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.4/aoclb-osx-x64.tar.gz"
    sha256 "1faadee31ea6af8388581b5214965e55b1c364cfb3f4aa7eace921b2dfe8797f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.4/aoclb-osx-arm64.tar.gz"
    sha256 "6b7634fb3049231eec3b9c66583e24ce094f5c062fb069d4684f488917d90f13"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.4/aoclb-linux-x64.tar.gz"
    sha256 "bf76956c06ed6b9ea8356563b8ab22dd7c48a98c60645abea0c0287edc756a54"
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
