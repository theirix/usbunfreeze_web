# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usbunfreeze_web/version'

Gem::Specification.new do |spec|
  spec.name          = "usbunfreeze_web"
  spec.version       = UsbunfreezeWeb::VERSION
  spec.authors       = ["theirix"]
  spec.email         = ["theirix@gmail.com"]
  spec.summary       = %q{Usubunfreeze web server}
  spec.description   = %q{Web application for Usbunfreeze kit}
  spec.homepage      = "http://github.com/theirix/usbunfreeze_web"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1"
  spec.add_development_dependency "rake", "~> 10"
  spec.add_runtime_dependency "sinatra", "~> 1.4"
  spec.add_runtime_dependency "sprockets-helpers", "~> 1.2"
  spec.add_runtime_dependency "sass", "~> 3.4"
  spec.add_runtime_dependency "haml", "~> 4.0"
  spec.add_runtime_dependency "settingslogic", "~> 2.0"
  spec.add_runtime_dependency "thin", "~> 1.6"
  spec.add_runtime_dependency "sinatra-flash", "~> 0.3"
  spec.add_runtime_dependency "aws-sdk", "~> 2"
  spec.add_runtime_dependency "tilt", "~> 2.0"
end
