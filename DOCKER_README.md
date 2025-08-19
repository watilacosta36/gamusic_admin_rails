# 🐳 Docker Setup - GaMusic Admin Rails

Configuração completa do Docker para desenvolvimento e produção do sistema GaMusic Admin Rails.

## 🚀 Quick Start

### 1. Setup Inicial
```bash
# Clone o repositório
git clone <repository-url>
cd gamusic_admin_rails

# Setup inicial (copia .env.docker para .env)
make setup

# Edite o arquivo .env com suas credenciais Supabase
nano .env
```

### 2. Configurar Credenciais Supabase
Edite o arquivo `.env` com suas credenciais:
```env
# Substitua com suas credenciais reais do Supabase
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your_anon_key_here
SUPABASE_DATABASE_URL=postgresql://postgres:your_password@db.your-project.supabase.co:5432/postgres
```

### 3. Executar a Aplicação
```bash
# Build e start dos containers
make build
make up

# Ou em um comando
make dev
```

### 4. Acessar a Aplicação
- **Rails App**: http://localhost:3000
- **Adminer (DB Admin)**: http://localhost:8080
- **PostgreSQL**: localhost:5432
- **Redis**: localhost:6379

## 📦 Serviços Inclusos

### 🐘 PostgreSQL Database
- **Image**: postgres:15
- **Port**: 5432
- **Database**: gamusic_admin_development
- **User**: postgres / postgres

### 🚀 Rails Application
- **Port**: 3000
- **Environment**: development
- **Auto-reload**: Enabled (volume mount)

### 🔴 Redis
- **Port**: 6379
- **Usage**: Background jobs, caching, Action Cable

### 🔧 Adminer
- **Port**: 8080
- **Purpose**: Database administration interface

## 🛠️ Comandos Disponíveis

### Gerenciamento dos Containers
```bash
make build          # Build das imagens Docker
make up             # Start todos os serviços
make down           # Stop todos os serviços
make restart        # Restart todos os serviços
make logs           # Ver logs de todos os serviços
make logs-web       # Ver logs apenas do Rails
make clean          # Remover containers e volumes
```

### Desenvolvimento
```bash
make shell          # Abrir shell no container Rails
make console        # Abrir Rails console
make db-shell       # Abrir PostgreSQL shell
make migrate        # Executar migrações
make seed           # Executar seeds
make test           # Executar testes
```

### Database Management
```bash
make adminer        # Instruções para acessar Adminer
make migrate        # rails db:migrate
make seed           # rails db:seed
```

## 📁 Estrutura Docker

```
gamusic_admin_rails/
├── Dockerfile              # Imagem Rails principal
├── docker-compose.yml      # Configuração desenvolvimento
├── docker-compose.prod.yml # Overrides para produção
├── docker-entrypoint.sh    # Script de inicialização
├── .dockerignore           # Arquivos ignorados no build
├── .env.docker             # Template de environment
├── init.sql                # Setup inicial do PostgreSQL
├── Makefile                # Comandos facilitados
└── DOCKER_README.md        # Esta documentação
```

## 🔧 Configuração Avançada

### Volumes Persistentes
```yaml
volumes:
  postgres_data:    # Dados do PostgreSQL
  redis_data:       # Dados do Redis  
  bundle_cache:     # Cache das gems Ruby
```

### Environment Variables
```bash
# Database
DATABASE_URL=postgresql://postgres:postgres@db:5432/gamusic_admin_development
REDIS_URL=redis://redis:6379/0

# Rails
RAILS_ENV=development
RAILS_MAX_THREADS=5

# Supabase (configure no .env)
SUPABASE_URL=...
SUPABASE_ANON_KEY=...
SUPABASE_DATABASE_URL=...
```

## 🚀 Deploy para Produção

### 1. Build para Produção
```bash
make prod-build
```

### 2. Configurar Variáveis de Produção
```bash
# .env.production
RAILS_ENV=production
DATABASE_URL=<sua-database-url-producao>
REDIS_URL=<sua-redis-url-producao>
SECRET_KEY_BASE=<generate-with-rails-secret>
```

### 3. Deploy
```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

## 🐛 Troubleshooting

### Container não inicia
```bash
# Ver logs detalhados
make logs

# Rebuild completo
make clean
make build
make up
```

### Database connection error
```bash
# Verificar se PostgreSQL está rodando
docker-compose ps

# Conectar manualmente ao banco
make db-shell
```

### Port já em uso
```bash
# Verificar portas em uso
lsof -i :3000
lsof -i :5432

# Parar serviços conflitantes
make down
```

### Permission errors
```bash
# Rebuild with correct permissions
make clean
make build
```

## 📝 Development Workflow

### Desenvolvimento Diário
```bash
# Manhã - iniciar ambiente
make up

# Desenvolvimento normal
# (code changes são auto-reloaded)

# Noite - parar ambiente  
make down
```

### Adicionando Novas Gems
```bash
# Editar Gemfile
nano Gemfile

# Rebuild container
make rebuild
```

### Database Changes
```bash
# Criar nova migração
make shell
rails generate migration CreateNewTable

# Aplicar migração
make migrate
```

## 🎯 Benefícios do Setup Docker

### ✅ Desenvolvimento
- **Isolamento**: Ambiente idêntico para todos os devs
- **Simplicidade**: Um comando para rodar tudo
- **Consistência**: Mesmas versões de Ruby, PostgreSQL, Redis
- **Clean**: Não polui a máquina local

### ✅ Deploy
- **Portabilidade**: Roda em qualquer lugar
- **Escalabilidade**: Fácil de escalar horizontalmente
- **Versionamento**: Imagens são versionadas
- **Rollback**: Fácil voltar versões anteriores

### ✅ Team Collaboration  
- **Onboarding**: Setup em minutos para novos devs
- **Dependencies**: Todas as dependências containerizadas
- **Database**: Schema sempre atualizado
- **Testing**: Ambiente limpo para cada teste

---

**🐳 Docker Setup completo para GaMusic Admin Rails** - Desenvolvimento e produção simplificados!