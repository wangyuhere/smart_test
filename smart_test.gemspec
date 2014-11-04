# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smart_test/version'

Gem::Specification.new do |spec|
  spec.name          = "smart_test"
  spec.version       = SmartTest::VERSION
  spec.authors       = ["Yu Wang"]
  spec.email         = ["wangyuhere@gmail.com"]
  spec.summary       = %q{Run tests smartly.}
  spec.description   = %q{Find which tests need to be run based on files last modified at and git diff.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
