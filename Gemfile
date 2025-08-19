source "https://rubygems.org"

gem "rails", "~> 8.0.2", ">= 8.0.2.1"             # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"

gem "propshaft"                                   # The modern asset pipeline for Rails [https://github.com/rails/propshaft]

gem "pg", "~> 1.1"                                # Use postgresql as the database for Active Record

gem "puma", ">= 5.0"                              # Use the Puma web server [https://github.com/puma/puma]

gem "importmap-rails"                             # Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]

gem "turbo-rails"                                 # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]

gem "stimulus-rails"                              # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]

gem "jbuilder"                                    # Build JSON APIs with ease [https://github.com/rails/jbuilder]

gem "bcrypt", "~> 3.1.7"                          # Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]

gem "jwt"                                         # A ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.

gem "httparty"                                    # Makes http fun again! Ain't no party like a httparty, because a httparty don't stop.

gem "tzinfo-data", platforms: %i[ windows jruby ] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem

gem "solid_cache"                                 # Use the database-backed adapters for Rails.cache, Active Job, and Action Cable

gem "solid_queue"

gem "solid_cable"

gem "bootsnap", require: false                    # Reduces boot times through caching; required in config/boot.rb

gem "kamal", require: false                       # Deploy this application anywhere as a Docker container [https://kamal-deploy.org]

gem "thruster", require: false                    # Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]

gem "image_processing", "~> 1.2"                  # Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]

gem "kaminari"                                    # A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude" # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "brakeman", require: false                                      # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "rubocop-rails-omakase", require: false                         # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "dotenv-rails"                                                  # About A Ruby gem to load environment variables from `.env`.
end

group :development do
  gem "web-console"                                                   # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "error_highlight", ">= 0.4.0", platforms: [ :ruby ]             # The gem enhances Exception#message by adding a short explanation where the exception is raised
  gem "listen"                                                        # The Listen gem listens to file modifications and notifies you about the changes.
  gem "pry-rails"                                                     # Avoid repeating yourself, use pry-rails instead of copying the initializer to every rails project
end
