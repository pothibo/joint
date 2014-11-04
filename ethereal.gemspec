# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ethereal/version'

Gem::Specification.new do |spec|
  spec.name          = "ethereal"
  spec.version       = Ethereal::VERSION
  spec.authors       = ["Pier-Olivier Thibault"]
  spec.email         = ["pothibo@gmail.com"]
  spec.summary       = %q{Event based JavaScript framework tailored for Ruby on rails.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end