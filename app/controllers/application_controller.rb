class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate

  # def allow_cross_site_json_requests
    # if request.format.json?
    #   headers['Access-Control-Allow-Origin'] = '*'
    #   headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    #   headers['Access-Control-Request-Method'] = '*'
    #   headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    # end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:workshop_key])
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  # Authenticate the user with token based authentication
  def authenticate
    return true if controller_name == 'homes' && action_name == 'show'
    if request.format.json?
      authenticate_token || render_json_unauthorized
    else
      authenticate_user!
    end
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(api_key: token)
    end
  end

  def render_json_unauthorized #(realm = "Application")
    # allow_cross_site_json_requests
    # self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    render plain: 'Invalid API token', status: :unauthorized
  end

end
