# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'data_structs/version'

Gem::Specification.new do |spec|
  spec.name          = 'data_structs'
  spec.version       = DataStructs::VERSION
  spec.authors       = ['Suraj Pratap']
  spec.email         = %w(suraj.pratap24@gmail.com)
  spec.description   = %q{High performance data structures in Ruby}
  spec.summary       = %q{These are objective data structures.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
