require 'formula'

class ArmNoneEabiBinutils < Formula
	homepage 'https://www.gnu.org/software/binutils/'
	url 'http://ftp.gnu.org/gnu/binutils/binutils-2.23.2.tar.bz2'
	sha1 '042c51073205ebaf88c272d6168f9deb71984b56'
	version '2.23.2'

	def install
#		ENV['CC'] = 'llvm-gcc-4.2'
#		ENV['CXX'] = 'llvm-g++-4.2'
#		ENV['LD'] = 'llvm-gcc-4.2'

		target = 'arm-none-eabi'

		args = [
			"--target=#{target}",
			"--prefix=#{prefix}",
			"--infodir=#{info}",
			"--mandir=#{man}",

			'--disable-debug',
			'--disable-nls',
			'--disable-werror',
			"--disable-install-libiberty",
#			"--enable-poison-system-directories",
			
			"--enable-interwork",
			"--enable-multilib",
		]

		mkdir 'build' do
			system '../configure',*args
			system 'make all'
			system 'make install'

			# Removes stupid libiberty.a
			FileUtils.rm_rf prefix/"lib/x86_64"
		end
	end
end
