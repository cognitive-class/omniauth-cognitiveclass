# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "omniauth-cognitiveclass"
  spec.version       = File.open("VERSION", "r").read.strip
  spec.authors       = ["Leons Petrazickis"]
  spec.email         = ["support@cognitiveclass.ai"]
  spec.summary       = "CognitiveClass strategy for the Omniauth Oauth2 Ruby library "
  spec.description   = "`omniauth-cognitiveclass` is a strategy (plugin or extension) for OmniAuth,
                        which is a Ruby authentication library. OmniAuth integrates transparently
                        with Devise, a popular Rails authentication solution.

                        [Cognitive Class](https://courses.cognitiveclass.ai/) is also known as Big
                        Data University. It's based on the OpenEdx platform"
  spec.homepage      = "https://github.com/cognitiveclass/omniauth-cognitiveclass"
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
