class User < ApplicationRecord
  self.primary_key = "id"

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :challenges, dependent: :destroy

  def self.find_or_create_from_supabase(supabase_user_data)
    user_id = supabase_user_data["id"]
    email = supabase_user_data["email"]
    name = supabase_user_data.dig("user_metadata", "name") || email.split("@").first

    find_or_create_by(id: user_id) do |user|
      user.email = email
      user.name = name
    end
  end
end
