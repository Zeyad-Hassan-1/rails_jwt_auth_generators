# frozen_string_literal: true

require_relative "lib/rails_jwt_auth_generators/version"

Gem::Specification.new do |spec|
  spec.name          = "rails_jwt_auth_generators"
  spec.version       = RailsJwtAuthGenerators::VERSION
  spec.authors       = ["Zeyad-Hassan-1"]
  spec.email         = ["studying.zezo@gmail.com"]

  spec.summary       = "Rails generators for JWT authentication boilerplate"
  spec.description   = "Generates JWT auth concerns, controllers, and user models for Rails APIs"
  spec.homepage      = "https://github.com/Zeyad-Hassan-1/rails_jwt_auth_generators"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  # spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage + "/tree/main"
  spec.metadata["changelog_uri"] = spec.homepage + "/blob/main/CHANGELOG.md"

  # Modified files section to avoid recursive inclusion
  spec.files = Dir.glob(%w[
    lib/**/*.rb
    lib/**/*.tt
    lib/**/*.erb
    lib/generators/**/*
    bin/*
    [A-Z]*
  ]).reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 6.0", "< 9.0"
end