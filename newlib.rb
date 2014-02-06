require 'formula'

class Newlib < Formula
  url 'ftp://sources.redhat.com/pub/newlib/newlib-1.19.0.tar.gz'
  homepage 'http://sourceware.org/newlib/'
  sha1 'b2269d30ce7b93b7c714b90ef2f40221c2df0fcd'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end