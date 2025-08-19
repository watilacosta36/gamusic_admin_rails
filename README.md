# 🎵 GaMusic Admin Rails

Sistema administrativo completo para gerenciamento de desafios musicais construído com **Ruby on Rails 7.2** e integração **Supabase**.

## ✨ Funcionalidades

### 🔐 Autenticação
- Login via Supabase Auth com JWT
- Sessões seguras server-side
- Sincronização automática de usuários

### 🎼 Gestão de Desafios
- **CRUD completo** de desafios musicais
- **Categorias**: escala, acorde, arpejo, ritmo, melodia, harmonia, técnica
- **Níveis**: iniciante, intermediário, avançado
- **Metadados musicais**: tom, tempo (BPM), instruções
- **Upload de arquivos**: MusicXML (.mxml) e PDF

### 📊 Dashboard Administrativo
- Estatísticas em tempo real
- Filtros por categoria e dificuldade
- Busca por título
- Interface responsiva com Tailwind CSS

### 🎯 Visualização
- Visualizador PDF integrado (a ser implementado)
- Download de arquivos MusicXML
- Layout moderno com sidebar

## 🏗️ Arquitetura

### **Backend**
- **Framework**: Ruby on Rails 7.2
- **Database**: PostgreSQL via Supabase
- **Authentication**: Supabase JWT + Sessions
- **File Storage**: Active Storage (preparado para Google Cloud)

### **Frontend**
- **CSS Framework**: Tailwind CSS (via CDN)
- **JavaScript**: Hotwire (Turbo + Stimulus)
- **UI Components**: Custom Rails views
- **Icons**: Unicode emojis (temporário)

### **Database Schema**
```ruby
# Users (UUID primary key)
- id: uuid
- email: string (unique)
- name: string
- metadata: text

# Challenges (UUID primary key)  
- id: uuid
- title: string
- description: text
- category: string (enum)
- difficulty: string (enum)
- music_key: string
- tempo: integer
- instructions: text
- user_id: uuid (foreign key)
```

## 🚀 Setup e Instalação

### **Opção 1: Docker (Recomendado)**
```bash
# Clone o repositório
git clone <repository-url>
cd gamusic_admin_rails

# Setup inicial com Docker
make setup

# Edite .env com suas credenciais Supabase
nano .env

# Build e start
make build && make up
```

Acesse: `http://localhost:3000`

📋 **Documentação Docker completa**: [DOCKER_README.md](./DOCKER_README.md)

### **Opção 2: Instalação Local**

**Pré-requisitos**
- Ruby 3.1+
- PostgreSQL
- Supabase Project

```bash
# 1. Clonar e instalar
git clone <repository-url>
cd gamusic_admin_rails
bundle install

# 2. Configurar environment
cp .env.example .env
# Edite .env com suas credenciais Supabase

# 3. Setup database
rails db:migrate

# 4. Start server
rails server
```

Acesse: `http://localhost:3000`

## 🔧 Configuração do Supabase

### **1. Criar Projeto Supabase**
1. Acesse [Supabase Dashboard](https://supabase.com/dashboard)
2. Crie um novo projeto
3. Anote as credenciais em Settings → API

### **2. Configurar Autenticação**
- Habilite Email/Password authentication
- Configure redirect URLs se necessário

### **3. Obter Database URL**
- Vá em Settings → Database
- Copie Connection string (Transaction pooler)
- Substitua `[YOUR-PASSWORD]` pela senha real

## 📁 Estrutura do Projeto

```
gamusic_admin_rails/
├── app/
│   ├── controllers/
│   │   ├── application_controller.rb    # Base + autenticação
│   │   ├── sessions_controller.rb       # Login/logout
│   │   ├── dashboard_controller.rb      # Dashboard admin
│   │   └── challenges_controller.rb     # CRUD desafios
│   ├── models/
│   │   ├── user.rb                      # Modelo usuário
│   │   └── challenge.rb                 # Modelo desafio
│   ├── services/
│   │   └── supabase_service.rb          # Integração Supabase
│   └── views/
│       ├── layouts/
│       │   └── application.html.erb     # Layout principal
│       ├── sessions/
│       │   └── new.html.erb             # Página de login
│       ├── dashboard/
│       │   └── index.html.erb           # Dashboard
│       └── challenges/
│           ├── index.html.erb           # Lista desafios
│           ├── show.html.erb            # Detalhes
│           └── new.html.erb             # Criar desafio
├── config/
│   ├── database.yml                     # Config Supabase
│   └── routes.rb                        # Rotas da aplicação
└── db/
    └── migrate/                         # Migrações Rails
```

## 🎨 Interface

### **Telas Principais**
- 🔐 **Login**: Autenticação via Supabase
- 📊 **Dashboard**: Cards de estatísticas + tabela recent
- 🎵 **Desafios**: Lista com filtros + CRUD completo
- 👁️ **Visualizar**: Detalhes + PDF viewer (em breve)

### **Design System**
- **Layout**: Sidebar + header responsivo
- **Colors**: Tailwind default (gray, blue, green, red)
- **Typography**: Sans-serif system fonts
- **Components**: Cards, tables, forms, buttons

## 🔄 Próximos Passos

### **Implementações Futuras**
1. **Active Storage** completo para upload
2. **Google Cloud Storage** integration
3. **PDF Viewer** com iframe
4. **API REST** completa
5. **Tests** com RSpec
6. **Deploy** automation
7. **Real-time** updates com ActionCable

### **Melhorias de UX**
1. **Dark mode** toggle
2. **Drag & drop** file upload
3. **Progress bars** para uploads
4. **Toast notifications**
5. **Search** melhorado
6. **Pagination** na tabela

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit suas changes (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para detalhes.

---

**🎵 GaMusic Admin Rails** - Gestão profissional de desafios musicais com Ruby on Rails moderno.