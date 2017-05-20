class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, :if => :devise_controller?

  protected
  
  def configure_permitted_parameters
    ## pre-devise 4
    # devise_parameter_sanitizer.for(:sign_up) << :username
    # devise_parameter_sanitizer.for(:sign_up) << :name

    devise_parameter_sanitizer.permit( :sign_up, :keys => [ :username ] )
  end

end

def puts! args, label=""
  puts "+++ +++ #{label}"
  puts args.inspect
end
