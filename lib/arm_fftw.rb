require 'narray'
require "arm_fftw/version"
require "arm_fftw/arm_fftw"

module ARM
  module FFTW
    def self.fft(*args)
      args.insert(1, -1)
      fft_raw(*args)
    end

    def self.ifft(*args)
      args.insert(1, 1)
      fft_raw(*args)
    end  
  end  
end
