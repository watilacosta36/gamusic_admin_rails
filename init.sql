-- Initial database setup for development
-- This file is run when the PostgreSQL container starts

-- Enable UUID extension for Rails UUID primary keys
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create development and test databases
CREATE DATABASE gamusic_admin_development;
CREATE DATABASE gamusic_admin_test;

-- Grant permissions
GRANT ALL PRIVILEGES ON DATABASE gamusic_admin_development TO postgres;
GRANT ALL PRIVILEGES ON DATABASE gamusic_admin_test TO postgres;