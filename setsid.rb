# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Setsid < Formula
  desc "A quick poor man's setsid command for Mac OS X and other Unixes that lack one"
  homepage "https://github.com/jerrykuch/ersatz-setsid"
  url "https://github.com/jerrykuch/ersatz-setsid/archive/master.zip"
  sha256 "b3b5356bca2e3dbcaa8d8f4db5ba42eff453768b2441d487883614ea5587f7a2"
  version "0.1"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "make" # if this fails, try separate make/make install steps
    bin.install "setsid"
    #system "mv", "setsid", "bin/"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test ersatz-setsid`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
