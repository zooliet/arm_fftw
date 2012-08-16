require 'arm_fftw'

na = NArray.float(8,1)
na = [0.3535, 0.3535, 0.6464, 1.0607, 0.3535, -1.0607, -1.3535, -0.3535]

fc = ARM::FFTW.fft(na)
fc.each {|f| puts "#{f.real.round(2)} + j#{f.imaginary.round(2)}"}