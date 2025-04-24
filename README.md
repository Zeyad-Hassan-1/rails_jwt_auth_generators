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
```plaintext

And then execute:

```bash
bundle install
```plaintext

Or install it yourself as:

```bash
gem install rails_jwt_auth_generators
```

## Usage

To generate the JWT authentication boilerplate, run the following command:

```bash
rails generate auth:jwt
```

This will create the following files in your Rails application:

- `app/controllers/concerns/json_web_token.rb`
- `app/controllers/authentication_controller.rb`
- `app/controllers/users_controller.rb`
- `app/models/user.rb`

### Example Workflow

1. **Setup User Model**: Ensure your database has a `users` table with the necessary fields (`username`, `email`, `password_digest`).

2. **Authentication**: Use the `AuthenticationController` to handle login requests. It will return a JWT token upon successful authentication.

3. **Authorization**: Use the `JsonWebToken` concern to decode and verify tokens in your application.

4. **User Management**: Use the `UsersController` to manage user resources.

## Generated Files

### JsonWebToken Concern

Handles JWT encoding and decoding.

```ruby
module JsonWebToken
  SECRET_KEY = Rails.application.secret_key_base

  def jwt_encode(payload, exp = 7.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def jwt_decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(decoded)
  end
end
```

### AuthenticationController

Handles user login and token generation.

```ruby
class AuthenticationController < ApplicationController
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
```

### UsersController

Manages user resources.

```ruby
class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
```

### User Model

Defines the user with secure password handling.

```ruby
class User < ApplicationRecord
  has_secure_password
  validates :email, :username, presence: true
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run:

```bash
bundle exec rake install
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/Zeyad-Hassan-1/rails_jwt_auth_generators](https://github.com/Zeyad-Hassan-1/rails_jwt_auth_generators). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).

## Code of Conduct

Everyone interacting in the RailsJwtAuthGenerators project's codebases, issue trackers, chat rooms, and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).

```

Similar code found with 2 license types
