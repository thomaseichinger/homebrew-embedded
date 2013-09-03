require 'formula'

class ArmNoneEabiLinaroGdb < Formula
  homepage 'http://www.linaro.org'
  url 'https://launchpad.net/gdb-linaro/7.5/7.5-2012.12/+download/gdb-linaro-7.5-2012.12.tar.bz2'
  sha1 'aba6f78c649e1ea45ca10d8ed2d89f4bcb050353'


  def install
    target = 'arm-none-eabi'

    ENV['CFLAGS'] = '-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0'
    
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
