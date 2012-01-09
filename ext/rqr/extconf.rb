=begin
  usage: ruby extconf.rb [options ...]
  configure options:
    --with-opt-dir=/path/to/libraries
    --with-jpeg-include=dir
    --with-jpeg-lib=dir
    --with-png-include=dir
    --with-png-lib=dir
    --with-tiff-include=dir
    --with-tiff-lib=dir
=end
require 'mkmf'
require 'rbconfig'

if File.exists?('/sw')
  DARWIN_PORT_DIR = '/sw'
elsif File.exists?('/usr/local')
  DARWIN_PORT_DIR = '/usr/local'
elsif File.exists?('/opt/local')
  DARWIN_PORT_DIR = '/opt/local'
elsif RUBY_PLATFORM =~ /darwin/
  raise "Could not find /sw, /usr/local, or /usr/local. Do you have native library dependencies installed?"
end

if RUBY_PLATFORM =~ /darwin/
  dir_config('jpeg', DARWIN_PORT_DIR)
  dir_config('png', DARWIN_PORT_DIR)
  dir_config('tiff', DARWIN_PORT_DIR)
else
  $libs = append_library($libs, "supc++")
  dir_config('jpeg')
  dir_config('png')
  dir_config('tiff')
end

if have_header('jpeglib.h') && have_library('jpeg')
  $CFLAGS += ' -DUSE_JPG'
end

if have_header('png.h') && have_library('png')
  $CFLAGS += ' -DUSE_PNG'
end

if have_header('tiff.h') && have_library('tiff')
  $CFLAGS += ' -DUSE_TIFF'
end
create_makefile('rqr/QR')
