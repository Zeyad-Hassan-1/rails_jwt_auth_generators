# Rails JWT Auth Generators

[![Gem Version](https://badge.fury.io/rb/rails_jwt_auth_generators.svg)](https://badge.fury.io/rb/rails_jwt_auth_generators)
[![Build Status](https://github.com/Zeyad-Hassan-1/rails_jwt_auth_generators/actions/workflows/main.yml/badge.svg)](https://github.com/Zeyad-Hassan-1/rails_jwt_auth_generators/actions)

Rails JWT Auth Generators is a Ruby gem that provides Rails generators to quickly scaffold JWT-based authentication boilerplate for Rails APIs. It includes concerns, controllers, and user models to streamline the process of setting up authentication in your Rails application.

## Features

- Generates a `JsonWebToken` concern for encoding and decoding JWTs.
- Creates an `AuthenticationController` for handling login requests.
- Scaffolds a `UsersController` for managing user resources.
- Generates a `User` model with secure password handling.
- Compatible with Rails 6.0 and above.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_jwt_auth_generators'