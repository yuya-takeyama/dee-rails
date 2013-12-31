# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dee/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "dee-rails"
  spec.version       = Dee::Rails::VERSION
  spec.authors       = ["Yuya Takeyama"]
  spec.email         = ["sign.of.the.wolf.pentagram@gmail.com"]
  spec.description   = %q{Rails extention of Dee the DI Container}
  spec.summary       = %q{Rails extention of Dee the DI Container}
  spec.homepage      = "https://github.com/yuya-takeyama/dee-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "dee", "~> 0.0.1"
  spec.add_dependency "rails", ">= 3", "< 5"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
