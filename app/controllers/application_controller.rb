class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has()
  allow_browser versions: :modern
  
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  private
  
  def authenticate_user!
    @current_user = current_user
    redirect_to login_path unless @current_user
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    
    @current_user = nil
    
    # Check for session-based authentication
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    end
    
    # Check for JWT token in headers (for API calls)
    if request.headers['Authorization'].present?
      token = request.headers['Authorization'].gsub('Bearer ', '')
      @current_user = SupabaseService.get_user_from_token(token)
    end
    
    @current_user
  end
  
  def require_authentication
    render json: { error: 'Unauthorized' }, status: :unauthorized unless current_user
  end
end