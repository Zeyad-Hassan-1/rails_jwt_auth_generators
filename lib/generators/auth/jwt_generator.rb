module Auth
  class JwtGenerator < Rails::Generators::Base
    desc "This generator creates JWT auth files (no arguments needed)"
    source_root File.expand_path('templates', __dir__)

    def create_auth_files
      template "json_web_token.rb", "app/controllers/concerns/json_web_token.rb"
      template "authentication_controller.rb", "app/controllers/authentication_controller.rb"
      template "users_controller.rb", "app/controllers/users_controller.rb"
      template "user.rb", "app/models/user.rb"
    end
    
    def modify_application_controller
      inject_into_class "app/controllers/application_controller.rb", "ApplicationController" do
        <<-RUBY
  include JsonWebToken
  before_action :authenticate_request
  private
  def authenticate_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end
        RUBY
      end
    end
    
    def add_routes
      route <<-ROUTES
  resources :users
  post "/auth/login", to: "authentication#login"
      ROUTES
    end
  end
end