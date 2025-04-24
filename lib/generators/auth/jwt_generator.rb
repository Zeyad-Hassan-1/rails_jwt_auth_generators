module Auth
  class JwtGenerator < Rails::Generators::Base  # Changed from NamedBase
    desc "This generator creates JWT auth files (no arguments needed)"
    source_root File.expand_path('templates', __dir__)

    def create_auth_files
      template "json_web_token.rb", "app/controllers/concerns/json_web_token.rb"
      template "authentication_controller.rb", "app/controllers/authentication_controller.rb"
      template "users_controller.rb", "app/controllers/users_controller.rb"
      template "user.rb", "app/models/user.rb"
    end
  end
end