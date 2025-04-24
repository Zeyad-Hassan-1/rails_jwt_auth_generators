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

  # Remove or comment out push host if not publishing to a private gem server
  # spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Zeyad-Hassan-1/rails_jwt_auth_generators"
  spec.metadata["changelog_uri"] = "https://github.com/Zeyad-Hassan-1/rails_jwt_auth_generators/blob/main/CHANGELOG.md"

  # Files to include in the gem
  gemspec = File.basename(__FILE__)
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == gemspec) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .github Gemfile])
    end
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Add Rails as a dependency
  spec.add_dependency "rails", ">= 6.0"
end