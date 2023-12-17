class Aoclb < Formula
  desc "Advent of Code Leaderboard CLI"
  homepage "https://github.com/dfribley/advent-of-code-leaderboard"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.1.1/aoclb-osx-x64.tar.gz"
    sha256 "fcce46a83989ae41b36b5e19ea539f036e095ba45cbbc21eddf3719ab03dc05a"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.1.1/aoclb-osx-arm64.tar.gz"
    sha256 "1137e05b3581ecfafc14b74676d05bc5b39979a09dd85248214270cfefadb013"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dfribley/advent-of-code-leaderboard/releases/download/v1.1.1/aoclb-linux-x64.tar.gz"
    sha256 "b6b115d96e09e4a01a0a09a6e056c95acf7fbba14f5a4a6d0ddf28c94d46ccd7"
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
