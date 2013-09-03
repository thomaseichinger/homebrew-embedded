require 'formula'

class ArmNoneEabiLinaroGdb < Formula
  homepage 'http://www.linaro.org'
  url 'https://launchpad.net/gdb-linaro/7.5/7.5-2012.12/+download/gdb-linaro-7.5-2012.12.tar.bz2'
  sha1 'aba6f78c649e1ea45ca10d8ed2d89f4bcb050353'

  depends_on 'gmp'
  depends_on 'libmpc'
  depends_on 'mpfr'
  depends_on 'arm-none-eabi-binutils'

  def install
    target = 'arm-none-eabi'
    
    args = [
        "--target=#{target}",
        "--prefix=#{prefix}",
        "--infodir=#{info}",
        "--mandir=#{man}",
        
        "--enable-interwork",
        "--enable-multilib",
    ]

    mkdir 'build' do
        system '../configure', *args
        system 'make all'
        system 'make install'
    end
  end
end
