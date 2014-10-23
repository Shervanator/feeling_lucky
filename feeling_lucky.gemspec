# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'feeling_lucky/version'

Gem::Specification.new do |spec|
  spec.name          = "feeling_lucky"
  spec.version       = FeelingLucky::VERSION
  spec.authors       = ["Shervin Aflatooni"]
  spec.email         = ["shervinaflatooni@gmail.com"]
  spec.summary       = %q{Hate NoMethodErrors? Are you feeling lucky?.}
  spec.description   = %q{Do you hate spelling mistakes? Did you forget what you called that method or attribute? Feeling lucky will fix that for you!}
  spec.homepage      = "https://github.com/Shervanator/feeling_lucky"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
