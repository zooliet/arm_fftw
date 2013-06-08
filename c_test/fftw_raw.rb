require 'arm_fftw'

FFT_SIZE = 2048

na = NArray.float(FFT_SIZE, 1)
# na = [0.3535, 0.3535, 0.6464, 1.0607, 0.3535, -1.0607, -1.3535, -0.3535]

na = (0...FFT_SIZE).map do |n|
  32768 + 50 * Math.sin(2*Math::PI*1100*(n/8000.to_f)).round(2)
end

i = 0
fc = ARM::FFTW.fft(na)/FFT_SIZE # Math.sqrt(1024).to_f
# fc.each do |f| 
  # if i > 100 and i < 200
  #   puts "#{i}: #{f.real.round(2)} + j#{f.imaginary.round(2)}"
  # end
  # i += 1
# end


(0...200).each do |i|
  f = fc[i]
  power =  ((f.real**2 + f.imaginary**2)**0.5).round(2)
  power_in_log = 10 * Math.log10(power)
  power_in_log = -80.0 if power_in_log.infinite? #or power_in_log < 0
  power_in_log.round(2).abs
  puts "**********************************************************"
  puts "FFT[#{i}]: #{f.real.round(2)} + j#{f.imaginary.round(2)}"
  puts "Power[#{i}]: #{power_in_log} dB"
end

f = fc[199]
puts "#{f.real.round(2)} + j#{f.imaginary.round(2)}"
power =  ((f.real**2 + f.imaginary**2)**0.5).round(2)
puts power
power_in_log = 10 * Math.log10(power)
puts power_in_log
# power_in_log = 0.0 if power_in_log.infinite?
# power_in_log.round(2).abs
# puts f.real, f.imaginary
# puts power_in_log