# GaMusic Admin Rails - Docker Commands

.PHONY: help build up down logs shell db-shell clean restart migrate seed

# Default target
help: ## Show this help message
	@echo "GaMusic Admin Rails - Available Commands:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Build Docker images
	docker compose build

up: ## Start all services
	docker compose run --service-ports web

down: ## Stop all services
	docker compose down

logs: ## Show logs from all services
	docker compose logs -f

logs-web: ## Show logs from Rails app only
	docker compose logs -f web

shell: ## Open shell in Rails container
	docker compose exec web bash

db-shell: ## Open PostgreSQL shell
	docker compose exec db psql -U postgres -d gamusic_admin_development

adminer: ## Open Adminer (database admin) - visit localhost:8080
	@echo "Adminer is available at: http://localhost:8080"
	@echo "Server: db"
	@echo "Username: postgres"
	@echo "Password: postgres"
	@echo "Database: gamusic_admin_development"

clean: ## Remove containers, networks, and volumes
	docker compose down -v
	docker system prune -f

restart: ## Restart all services
	docker compose restart

migrate: ## Run database migrations
	docker compose exec web rails db:migrate

seed: ## Run database seeds
	docker compose exec web rails db:seed

console: ## Open Rails console
	docker compose exec web rails console

test: ## Run tests
	docker compose exec web rails test

setup: ## First time setup (build, up, migrate)
	@echo "Setting up GaMusic Admin Rails for the first time..."
	cp .env.docker .env
	@echo "Please edit .env file with your Supabase credentials"
	@echo "Then run: make build && make up"

dev: ## Start development environment
	@echo "Starting development environment..."
	docker compose up

prod-build: ## Build for production
	docker compose -f docker-compose.yml -f docker-compose.prod.yml build

# Development workflow
start: up ## Alias for up
stop: down ## Alias for down
rebuild: ## Rebuild and restart
	docker compose down
	docker compose build
	docker compose up -d