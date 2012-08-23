require "mkmf"

# dir_config('fftw3','/usr/local')


narray_dir = File.dirname(Gem.find_files("narray.h").first) rescue $sitearchdir
dir_config('narray', narray_dir, narray_dir)
dir_config('fftw3','/usr/local')

if(!(have_header("narray.h") && have_header("narray_config.h")))
  puts "Verify the narray.gem and its location"
  exit(-1)
end

# have_library("fftw3")
if(!( have_header("fftw3.h") )) 
  puts "Check your FFTW3 library and path"
  exit(-1)  
end

if have_library("fftw3f")
  $CFLAGS += ' -DFFTW3_HAS_SINGLE_SUPPORT'
end


create_makefile("arm_fftw/arm_fftw")
