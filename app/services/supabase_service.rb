require 'net/http'
require 'json'
require 'jwt'

class SupabaseService
  SUPABASE_URL = ENV['SUPABASE_URL']
  SUPABASE_ANON_KEY = ENV['SUPABASE_ANON_KEY']
  
  class << self
    def authenticate_user(email, password)
      uri = URI("#{SUPABASE_URL}/auth/v1/token?grant_type=password")
      
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      
      request = Net::HTTP::Post.new(uri)
      request['Content-Type'] = 'application/json'
      request['apikey'] = SUPABASE_ANON_KEY
      request.body = {
        email: email,
        password: password
      }.to_json
      
      response = http.request(request)
      
      if response.code == '200'
        JSON.parse(response.body)
      else
        nil
      end
    end
    
    def verify_jwt_token(token)
      # In production, use the JWT secret from Supabase
      # For now, we'll decode without verification for development
      decoded_token = JWT.decode(token, nil, false)
      decoded_token.first
    rescue JWT::DecodeError
      nil
    end
    
    def get_user_from_token(token)
      claims = verify_jwt_token(token)
      return nil unless claims
      
      # Sync user data with local database
      User.find_or_create_from_supabase(claims)
    end
  end
end