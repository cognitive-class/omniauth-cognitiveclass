# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "omniauth-cognitiveclass"
  spec.version       = File.open("VERSION", "r").read.strip
  spec.authors       = ["Leons Petrazickis"]
  spec.email         = ["leonsp@ca.ibm.com"]
  spec.summary       = "OAuth2 client for Big Data University"
  spec.description   = spec.summary
  spec.homepage      = "http://bigdatauniversity.com"
  spec.license       = "MIT"

  # TODO: Remove dependency on git
  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # To install the gem locally:
  # bundle exec rake install
  spec.add_development_dependency "bundler-audit", "~> 0.5"

  spec.add_development_dependency "rake", "~> 12.0"

  # Unit tests
  spec.add_development_dependency "rspec", "~> 3.4"

  # Test coverage report
  spec.add_development_dependency "simplecov", "~> 0.12"

  # Automatic Ruby code style checking tool. Aims to enforce the community-driven
  # Ruby Style Guide.
  # https://github.com/bbatsov/rubocop
  spec.add_development_dependency "rubocop", "~> 0.46"

  spec.add_runtime_dependency "omniauth-oauth2", "~> 1.4"
end