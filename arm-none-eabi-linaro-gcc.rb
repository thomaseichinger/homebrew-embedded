require 'formula'

class ArmNoneEabiLinaroGcc < Formula
  homepage 'http://www.linaro.org'
  url 'https://launchpad.net/gcc-linaro/4.8/4.8-2014.01/+download/gcc-linaro-4.8-2014.01.tar.xz'
  sha1 '35c36518e256faabe92fa454d6ca7d178c971fb1'

  def install
    binutils = Formula.factory 'arm-none-eabi-binutils'

    ENV['CC'] = 'llvm-gcc'
    ENV['CXX'] = 'llvm-g++'
    ENV['LD'] = 'llvm-gcc'
    ENV['PATH'] += ":#{binutils.prefix/"bin"}"
    
    target = 'arm-none-eabi'
    
    gccbuildpath = buildpath
    newlib = Formula.factory 'newlib'
    newlib.brew do
        ohai "Moving newlib into GCC build tree"
        system "mv","newlib",gccbuildpath/"newlib"
        ohai "Moving libgloss into GCC build tree"
        system "mv","libgloss",gccbuildpath/"libgloss"
    end

    args = [
        "--target=#{target}",
        "--prefix=#{prefix}",
        "--infodir=#{info}",
        "--mandir=#{man}",
        
        "--enable-obsolete",
        "--disable-nls",
        "--disable-libssp",

#       '--disable-werror',
        
        "--enable-languages=c,c++", 

#       '--disable-decimal-float',
        '--with-headers',
        "--enable-interwork",
        "--enable-multilib",
        "--with-newlib",
#       "--disable-newlib-supplied-syscalls",

#       "--enable-newlib-io-long-long",
#       "--enable-version-specific-runtime-libs",   
#       "--enable-poison-system-directories",

#       "--enable-target-optspace",

#       "--without-included-gettext",
#       "--disable-install-libiberty",
#       "--disable-libunwind-exceptions",
#       "--disable-libffi",
#       '--disable-libmudflap',
#       '--disable-libgomp',
#       "--disable-__cxa_atexit",
#       "--disable-libgfortran",
#       "--disable-libssb",
#       "--disable-libstdcxx-pch",

        # Without this line, GCC won't be able to find the assembler.
        "--with-as=#{binutils.prefix}/bin/#{target}-as",

#       "--enable-newlib-io-reent-small",
#       "--with-float=soft",
#       "--with-abi=atpcs",     # Using old ABI for now.
#       "--enable-float",
#       "--enable-biendian",
    ]

    mkdir 'build' do
        system '../configure', *args
        system 'make all'
        system 'make install'
#       system 'make install-info'
        rm_rf prefix/"lib/x86_64"
    end
  end
end
