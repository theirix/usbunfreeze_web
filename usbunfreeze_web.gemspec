# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usbunfreeze_web/version'

Gem::Specification.new do |spec|
  spec.name          = "usbunfreeze_web"
  spec.version       = UsbunfreezeWeb::VERSION
  spec.authors       = ["theirix"]
  spec.email         = ["theirix@gmail.com"]
  spec.summary       = %q{Usubunfreeze web server.}
  spec.description   = %q{Usubunfreeze web server.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "sinatra", "~> 1.4.5"
  spec.add_runtime_dependency "sinatra-assetpack", "~> 0.3.3"
  spec.add_runtime_dependency "haml", "~> 4.0.0"
  spec.add_runtime_dependency "settingslogic", "~> 2.0.0"
  spec.add_runtime_dependency "thin", "~> 1.6.0"
  spec.add_runtime_dependency "sinatra-flash", "~> 0.3.0"
  spec.add_runtime_dependency "aws-sdk-v1", "~> 1.60.0"
end
