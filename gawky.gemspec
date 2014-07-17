# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gawky/version'

Gem::Specification.new do |spec|
  spec.name          = "gawky"
  spec.version       = Gawky::VERSION
  spec.authors       = ["Bruno Oliveira"]
  spec.email         = ["bruno@abstractj.org"]
  spec.summary       = %q{A stupid simple console tool to check pull requests}
  spec.homepage      = "https://github.com/abstractj/gawky"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
