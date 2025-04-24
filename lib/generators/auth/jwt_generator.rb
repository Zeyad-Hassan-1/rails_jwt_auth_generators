module Auth
  class JwtGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('templates', __dir__)

    desc "This generator creates a JWT auth concern and authentication controller"
    
    def create_auth_files
      # 1. Generate JWT Concern
      template "json_web_token.rb", "app/controllers/concerns/json_web_token.rb"

      # 2. Generate Authentication Controller
      template "authentication_controller.rb", "app/controllers/authentication_controller.rb"

      # 3. Generate UsersController
      template "users_controller.rb", "app/controllers/users_controller.rb"

      # 4. Generate User Model (optional, but recommended)
      template "user.rb", "app/models/user.rb"
    end
  end
end