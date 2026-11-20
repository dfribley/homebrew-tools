require "macho"

class Aoclb < Formula
  desc "Advent of Code Leaderboard CLI"
  homepage "https://github.com/dfribley/advent-of-code-leaderboard"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.5/aoclb-osx-x64.tar.gz"
    sha256 "f7542f7ed47179f55607063fd8a58192d5168f1acc1c54fb899e4d3ac5088e9f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.5/aoclb-osx-arm64.tar.gz"
    sha256 "86c1444993320730c8d49b3dc125a835ec346b2212831e91026488348b8d38ad"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.2.5/aoclb-linux-x64.tar.gz"
    sha256 "862928fca060a3b42f0327c0f857779528741f09feeca0e7d481c262c500d9cb"
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
