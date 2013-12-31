# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dee/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "dee-rails"
  spec.version       = Dee::Rails::VERSION
  spec.authors       = ["Yuya Takeyama"]
  spec.email         = ["sign.of.the.wolf.pentagram@gmail.com"]
  spec.description   = %q{Dee the DI Container for Rails}
  spec.summary       = %q{Dee the DI Container for Rails}
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
  spec.add_development_dependency "coveralls"
  # Workaround for rest-client dependency
  # https://github.com/rest-client/rest-client/issues/235
  spec.add_development_dependency "mime-types", "< 2"
end
