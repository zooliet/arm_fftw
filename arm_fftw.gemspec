# -*- encoding: utf-8 -*-
require File.expand_path('../lib/arm_fftw/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Junhyun Shin"]
  gem.email         = ["hl1sqi@gmail.com"]
  gem.description   = %q{T. Horinouchi's ruby-fftw3 on ARM}
  gem.summary       = %q{arm_fftw: T. Horinouchi's ruby-fftw3 on ARM}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "arm_fftw"
  # gem.require_paths = ["lib"]
  gem.require_paths = ["lib", "ext"]
  gem.extensions    = ["ext/extconf.rb"]
  # gem.version       = ArmFftw::VERSION  
  gem.version       = ARM::FFTW::VERSION
  
  gem.add_runtime_dependency(%q<narray>, [">= 0"])  
end
