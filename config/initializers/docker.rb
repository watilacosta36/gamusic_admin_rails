# Docker-specific configurations

# Ensure ActiveRecord migrations work with UUIDs
if Rails.env.development? && ENV['DATABASE_URL']&.include?('localhost') || ENV['DATABASE_URL']&.include?('@db:')
  Rails.logger.info "Running in Docker development environment"
  
  # Configure Active Storage for development
  Rails.application.configure do
    # Use local storage in Docker development
    config.active_storage.variant_processor = :mini_magick
  end
end