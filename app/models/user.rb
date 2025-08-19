class User < ApplicationRecord
  # Use UUID as primary key
  self.primary_key = 'id'
  
  # Validations
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  
  # Associations
  has_many :challenges, dependent: :destroy
  
  # Class methods
  def self.find_or_create_from_supabase(supabase_user_data)
    user_id = supabase_user_data['id']
    email = supabase_user_data['email']
    name = supabase_user_data.dig('user_metadata', 'name') || email.split('@').first
    
    find_or_create_by(id: user_id) do |user|
      user.email = email
      user.name = name
    end
  end
end