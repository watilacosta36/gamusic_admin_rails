# Use Ruby 3.4 official image
FROM ruby:3.4.5-slim

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    libyaml-dev \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    pkg-config \
    libpq-dev \
    postgresql-client \
    nodejs \
    npm \
    git \
    curl \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
RUN bundle install --jobs 4 --retry 3

# Copy the rest of the application
COPY . .

# Copy entrypoint script (optional)
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Create directories for Rails
RUN mkdir -p tmp/pids

# Expose port 3000
EXPOSE 3000

# Default command (using entrypoint is optional)
CMD ["rails", "server", "-b", "0.0.0.0"]