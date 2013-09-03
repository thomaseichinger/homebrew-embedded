require 'formula'

class ArmNoneEabiLinaroGcc < Formula
  #homepage 'http://gcc.gnu.org'
  #url 'http://ftpmirror.gnu.org/gcc/gcc-4.7.2/gcc-4.7.2.tar.bz2'
  #mirror 'http://ftp.gnu.org/gnu/gcc/gcc-4.7.2/gcc-4.7.2.tar.bz2'
  #sha1 'a464ba0f26eef24c29bcd1e7489421117fb9ee35'
  
  #url 'http://ftpmirror.gnu.org/gcc/gcc-4.3.2/gcc-4.3.2.tar.bz2'
  #mirror 'http://ftp.gnu.org/gnu/gcc/gcc-4.3.2/gcc-4.3.2.tar.bz2'
  #sha1 '787b566ad4f386a9896e2d5703e6ff5e7ccaca58'
  homepage 'http://www.linaro.org'
  url 'http://launchpad.net/gcc-linaro/4.8/4.8-2013.08/+download/gcc-linaro-4.8-2013.08.tar.xz'
  sha1 '987b8be406f103806cabe1372f34e782b6312ff7'

  depends_on 'gmp'
  depends_on 'libmpc'
  depends_on 'mpfr'
  depends_on 'arm-none-eabi-binutils'

  def install
    binutils = Formula.factory 'arm-none-eabi-binutils'

    ENV['CC'] = 'llvm-gcc-4.2'
    ENV['CXX'] = 'llvm-g++-4.2'
    ENV['LD'] = 'llvm-gcc-4.2'
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

#		'--disable-werror',
		
		"--enable-languages=c,c++",	

#		'--disable-decimal-float',
		'--with-headers',
		"--enable-interwork",
		"--enable-multilib",
		"--with-newlib",
#		"--disable-newlib-supplied-syscalls",

#		"--enable-newlib-io-long-long",
#		"--enable-version-specific-runtime-libs",	
#		"--enable-poison-system-directories",

#		"--enable-target-optspace",

#		"--without-included-gettext",
#		"--disable-install-libiberty",
#		"--disable-libunwind-exceptions",
#		"--disable-libffi",
#		'--disable-libmudflap',
#		'--disable-libgomp',
#		"--disable-__cxa_atexit",
#		"--disable-libgfortran",
#		"--disable-libssb",
#		"--disable-libstdcxx-pch",

		# Without this line, GCC won't be able to find the assembler.
		"--with-as=#{binutils.prefix}/bin/#{target}-as",

#		"--enable-newlib-io-reent-small",
#		"--with-float=soft",
#		"--with-abi=atpcs",		# Using old ABI for now.
#		"--enable-float",
#		"--enable-biendian",
	]

	mkdir 'build' do
		system '../configure', *args
		system 'make all'
		system 'make install'
#		system 'make install-info'
		FileUtils.rm_rf prefix/"lib/x86_64"
    end
  end
end
