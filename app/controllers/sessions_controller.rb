class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  
  def new
    # Login form
  end
  
  def create
    auth_response = SupabaseService.authenticate_user(
      params[:email], 
      params[:password]
    )
    
    if auth_response && auth_response['user']
      # Create user record locally if needed
      user = User.find_or_create_from_supabase(auth_response['user'])
      
      # Store user session
      session[:user_id] = user.id
      session[:supabase_token] = auth_response['access_token']
      
      redirect_to dashboard_path, notice: 'Login realizado com sucesso!'
    else
      flash.now[:alert] = 'Email ou senha inválidos'
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    session[:user_id] = nil
    session[:supabase_token] = nil
    redirect_to login_path, notice: 'Logout realizado com sucesso!'
  end
end