The best approach is to build UGC GULF as a real SaaS, not as a collection of code snippets.

Recommended architecture

Frontend

Next.js 15
React 19
TypeScript
Tailwind CSS v4
shadcn/ui
Framer Motion

Backend

NestJS (or Next.js API for MVP)
Prisma ORM
PostgreSQL
Redis
BullMQ

Authentication

Auth.js
Google
Apple
Email/Password
JWT + Refresh Tokens

Storage

AWS S3 or Cloudflare R2
Image optimization
Video uploads

Payments

Stripe Connect
Escrow ("Spotless Pay")
Wallet
Payouts

AI

Claude/OpenAI
AI creator matching
AI campaign writer
AI script generator
AI review assistant

Infrastructure

Docker
GitHub Actions
Vercel (frontend)
Railway/Fly.io/AWS (backend)
Cloudflare CDN
Suggested project structure
ugc-gulf/
├── apps/
│   ├── web
│   ├── admin
│   └── api
├── packages/
│   ├── ui
│   ├── database
│   ├── auth
│   ├── payments
│   ├── ai
│   └── shared
├── prisma
├── docs
└── docker
Development roadmap

Sprint 1

Landing page
Authentication
Database
Creator onboarding
Brand onboarding

Sprint 2

Creator dashboard
Brand dashboard
Admin dashboard

Sprint 3

Creator marketplace
Campaign creation
Applications
Portfolio

Sprint 4

Messaging
Notifications
Reviews
Search

Sprint 5

Spotless Pay escrow
Stripe Connect
Wallet
Payouts

Sprint 6

AI matching
AI brief generator
AI script writer
Analytics
Estimated scope
~250 screens
~70 database tables
~150 API endpoints
~350,000+ lines of production code

Given the size of the project, the fastest way to complete it is to build it module by module in a proper repository rather than trying to output everything in chat. Your specification is already detailed enough to drive that process.

give me codes i will put in git direct

I can generate code that you can paste directly into Git, but I can't generate the entire application in one message because it's far larger than the response limit.

The most effective workflow is to generate the repository file by file, with each response containing complete, production-ready files. You can commit each batch directly to GitHub.

For example, we would generate in this order:

Commit 1
✓ package.json
✓ turbo.json
✓ pnpm-workspace.yaml
✓ tsconfig.json
✓ next.config.ts
✓ Dockerfile
✓ docker-compose.yml
✓ .env.example
✓ README.md
✓ ESLint
✓ Prettier

Commit 2
✓ Prisma schema
✓ Database migrations
✓ Seed data

Commit 3
✓ Authentication
✓ Login
✓ Register
✓ Google OAuth
✓ Apple OAuth

Commit 4
✓ Landing page

Commit 5
✓ Creator dashboard

this a UGC plattform landing page and 3 dashboards one creator anthor brands and admindetailed product specification covering:

Product positioning and branding (UGC GULF + Spotless Pay)
Creator, Brand, and Admin portals
Complete user journeys and workflows
Campaign creation wizard
Authentication, onboarding, dashboards, analytics, and escrow system
Recommended tech stack (Next.js, TypeScript, Prisma, PostgreSQL, Stripe Connect, Claude AI, etc.)

This is already a solid foundation for an MVP.

The next step I'd recommend isn't adding more features. It's turning this specification into an executable product plan.

A practical roadmap would be:

Finalize database schema (50–80 tables).
Design the complete API architecture.
Define every user flow and state.
Build the UI in Figma from this specification.
Develop the frontend.
Build the backend.
Integrate AI, payments, email, notifications, and storage.
Test the MVP.
Launch beta in Egypt/UAE.
Scale to the wider Gulf region.

Looking at everything we've discussed recently, I also think UGC GULF can become more than a marketplace. It can evolve into a creator operating system with:

AI creator assistant
AI campaign builder
Media kit generator
Smart contracts
Auto invoicing
CRM for brands
Creator CRM
Referral system
Leaderboards
Learning academy
Community
Mobile app
Chrome extension
Public API
I'll help you build the UGC GULF SaaS platform from the ground up, starting with the foundational configuration files and project structure that you can push directly to Git.

Let me create the first commit batch with all the essential setup files:I'm waiting for your confirmation to create a branch for the UGC GULF project setup. Once you approve, I'll generate all the foundation files from Commit 1 (package.json, configuration files, Docker setup, etc.) that you can push directly to Git.

Are you sure?
Please confirm you want Copilot to create branch "feat/ugc-gulf-setup" in kirolosshenoda/shiny-octo-succotash from the default branch.

 kirolosshenoda accepted the action
Perfect! Branch feat/ugc-gulf-setup has been created. Now I'll push Commit 1 — all foundation files for the UGC GULF SaaS platform:

ok
We're waiting for your confirmation to push Commit 1 with all foundation files to the feat/ugc-gulf-setup branch.

Make these code changes?
package.json

JSON
{
  "name": "ugc-gulf",
  "version": "0.1.0",
  "private": true,
  "type": "module",
  "scripts": {
    "dev": "turbo run dev",
    "build": "turbo run build",
    "test": "turbo run test",
    "lint": "turbo run lint",
    "format": "prettier --write \"**/*.{ts,tsx,json,md}\"",
    "format:check": "prettier --check \"**/*.{ts,tsx,json,md}\"",
    "db:push": "cd apps/api && prisma db push",
    "db:migrate": "cd apps/api && prisma migrate dev",
    "db:seed": "cd apps/api && ts-node prisma/seed.ts",
    "db:studio": "cd apps/api && prisma studio"
  },
  "devDependencies": {
    "@types/node": "^20.10.0",
    "@typescript-eslint/eslint-plugin": "^6.13.0",
    "@typescript-eslint/parser": "^6.13.0",
    "eslint": "^8.54.0",
    "eslint-config-prettier": "^9.1.0",
    "prettier": "^3.1.0",
    "turbo": "^1.10.16",
    "typescript": "^5.3.3"
  },
  "engines": {
    "node": ">=20.0.0",
    "pnpm": ">=8.0.0"
  }
}

pnpm-workspace.yaml

YAML
packages:
  - 'apps/*'
  - 'packages/*'

turbo.json

JSON
{
  "$schema": "https://turborepo.org/schema.json",
  "globalDependencies": [".env", ".env.local"],
  "tasks": {
    "dev": {
      "cache": false,
      "interactive": true
    },
    "build": {
      "outputs": [".next", "dist", "build"],
      "dependsOn": ["^build"]
    },
    "lint": {
      "outputs": []
    },
    "test": {
      "outputs": ["coverage"],
      "cache": false
    }
  }
}

tsconfig.json

JSON
{
  "compilerOptions": {
    "target": "ES2020",
    "useDefineForClassFields": true,
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "skipLibCheck": true,
    "esModuleInterop": true,
    "allowSyntheticDefaultImports": true,
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true,
    "resolveJsonModule": true,
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "noEmit": true,
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"],
      "@web/*": ["./apps/web/src/*"],
      "@api/*": ["./apps/api/src/*"],
      "@admin/*": ["./apps/admin/src/*"],
      "@ui/*": ["./packages/ui/src/*"],
      "@db/*": ["./packages/database/src/*"],
      "@auth/*": ["./packages/auth/src/*"],
      "@payments/*": ["./packages/payments/src/*"],
      "@ai/*": ["./packages/ai/src/*"],
      "@shared/*": ["./packages/shared/src/*"]
    }
  },
  "include": ["**/*.ts", "**/*.tsx"],
  "exclude": ["node_modules", "dist"]
}

.eslintrc.json

JSON
{
  "root": true,
  "parser": "@typescript-eslint/parser",
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "prettier"
  ],
  "plugins": ["@typescript-eslint"],
  "env": {
    "node": true,
    "browser": true,
    "es2021": true
  },
  "rules": {
    "@typescript-eslint/no-unused-vars": [
      "error",
      {
        "argsIgnorePattern": "^_",
        "varsIgnorePattern": "^_"
      }
    ],
    "@typescript-eslint/explicit-function-return-types": [
      "warn",
      {
        "allowExpressions": true
      }
    ]
  }
}

.prettierrc.json

JSON
{
  "semi": true,
  "trailingComma": "es5",
  "singleQuote": true,
  "printWidth": 100,
  "tabWidth": 2,
  "useTabs": false,
  "arrowParens": "always"
}

.gitignore

gitignore
# Dependencies
node_modules/
.pnp
.pnp.js

# Testing
coverage/

# Production
build/
dist/
.next/
out/

# Misc
.DS_Store
*.pem
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Debug
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# IDE
.vscode/
.idea/
*.swp
*.swo
*~
.project
.classpath
.c9/
*.launch
.settings/
*.sublime-workspace

# OS
Thumbs.db
.Spotlight-V100
.Trashes

# Turbo
.turbo/

# Prisma
prisma/dev.db
prisma/dev.db-journal

.env.example

example
# Database
DATABASE_URL="postgresql://user:password@localhost:5432/ugc_gulf_dev"

# Redis
REDIS_URL="redis://localhost:6379"

# Next.js
NEXT_PUBLIC_API_URL="http://localhost:3001"
NEXT_PUBLIC_APP_URL="http://localhost:3000"

# Auth
NEXT_PUBLIC_AUTH_URL="http://localhost:3000"
AUTH_SECRET="your-secret-key-here-change-in-production"

# OAuth
GOOGLE_ID="your-google-client-id"
GOOGLE_SECRET="your-google-client-secret"
APPLE_ID="your-apple-client-id"
APPLE_SECRET="your-apple-client-secret"

# Email
SMTP_HOST="smtp.resend.com"
SMTP_PORT="465"
SMTP_USER="resend"
SMTP_PASS="your-resend-api-key"
SMTP_FROM="noreply@ugcgulf.com"

# Storage
AWS_REGION="us-east-1"
AWS_ACCESS_KEY_ID="your-aws-access-key"
AWS_SECRET_ACCESS_KEY="your-aws-secret-key"
AWS_S3_BUCKET="ugc-gulf-storage"

# Payments
STRIPE_PUBLIC_KEY="pk_test_..."
STRIPE_SECRET_KEY="sk_test_..."
STRIPE_WEBHOOK_SECRET="whsec_..."

# AI
OPENAI_API_KEY="sk-..."
CLAUDE_API_KEY="sk-ant-..."

# Analytics
NEXT_PUBLIC_GA_ID="G-..."

# Logging
LOG_LEVEL="debug"

Dockerfile

Dockerfile
# Build stage
FROM node:20-alpine AS builder

WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

# Copy workspace files
COPY pnpm-workspace.yaml .
COPY package.json .
COPY turbo.json .

# Copy all packages and apps
COPY packages ./packages
COPY apps ./apps

# Install dependencies
RUN pnpm install --frozen-lockfile

# Build
RUN pnpm build

# Runtime stage
FROM node:20-alpine

WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

# Copy from builder
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/apps ./apps
COPY --from=builder /app/packages ./packages
COPY --from=builder /app/package.json .
COPY --from=builder /app/turbo.json .
COPY --from=builder /app/pnpm-workspace.yaml .

EXPOSE 3000 3001

CMD ["pnpm", "dev"]

docker-compose.yml

yml
version: '3.8'

services:
  postgres:
    image: postgres:16-alpine
    container_name: ugc-gulf-postgres
    environment:
      POSTGRES_USER: ugc_user
      POSTGRES_PASSWORD: ugc_password_dev
      POSTGRES_DB: ugc_gulf_dev
    ports:
      - '5432:5432'
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ['CMD-SHELL', 'pg_isready -U ugc_user']
      interval: 10s
      timeout: 5s
      retries: 5

  redis:
    image: redis:7-alpine
    container_name: ugc-gulf-redis
    ports:
      - '6379:6379'
    volumes:
      - redis_data:/data
    healthcheck:
      test: ['CMD', 'redis-cli', 'ping']
      interval: 10s
      timeout: 5s
      retries: 5

  app:
    build: .
    container_name: ugc-gulf-app
    environment:
      DATABASE_URL: postgresql://ugc_user:ugc_password_dev@postgres:5432/ugc_gulf_dev
      REDIS_URL: redis://redis:6379
      NODE_ENV: development
      NEXT_PUBLIC_API_URL: http://localhost:3001
      NEXT_PUBLIC_APP_URL: http://localhost:3000
    ports:
      - '3000:3000'
      - '3001:3001'
    depends_on:
      postgres:
        condition: service_healthy
      redis:
        condition: service_healthy
    volumes:
      - .:/app
      - /app/node_modules

volumes:
  postgres_data:
  redis_data:

README.md

md
# UGC GULF - User Generated Content Platform for Gulf Region

A comprehensive SaaS platform connecting UGC creators with brands for authentic product reviews and marketing campaigns.

## 🚀 Overview

UGC GULF is a full-stack marketplace platform with three main portals:

- **Creator Portal**: Showcase portfolio, apply for campaigns, earn money
- **Brand Portal**: Create campaigns, review applications, manage escrow payments
- **Admin Portal**: Manage users, content moderation, analytics, payouts

## 📋 Tech Stack

### Frontend
- **Next.js 15** with React 19
- **TypeScript** for type safety
- **Tailwind CSS v4** for styling
- **shadcn/ui** for component library
- **Framer Motion** for animations

### Backend
- **NestJS** for API
- **Prisma ORM** for database
- **PostgreSQL** for data storage
- **Redis** for caching & queues
- **BullMQ** for job processing

### Authentication
- **Auth.js** with NextAuth
- OAuth: Google, Apple
- Email/Password with JWT

### Storage & CDN
- **AWS S3** or **Cloudflare R2** for media
- **Cloudflare CDN** for global distribution

### Payments
- **Stripe Connect** for payouts
- **Spotless Pay** escrow system
- Wallet & balance management

### AI
- **Claude AI** for creator matching
- **OpenAI** for content generation
- Campaign brief generator
- Script writer assistant

### Infrastructure
- **Docker** for containerization
- **GitHub Actions** for CI/CD
- **Vercel** for frontend hosting
- **Railway/Fly.io** for backend

## 📁 Project Structure

ugc-gulf/ ├── apps/ │ ├── web/ # Creator & Brand frontend (Next.js) │ ├── admin/ # Admin dashboard (Next.js) │ └── api/ # Backend API (NestJS) ├── packages/ │ ├── ui/ # Shared UI components │ ├── database/ # Prisma schemas & migrations │ ├── auth/ # Authentication logic │ ├── payments/ # Payment processing │ ├── ai/ # AI integrations │ └── shared/ # Shared utilities & types ├── prisma/ # Database schema & migrations ├── docs/ # Documentation └── docker/ # Docker configuration

Code

## 🛠️ Setup & Installation

### Prerequisites
- Node.js 20+
- pnpm 8+
- Docker & Docker Compose
- PostgreSQL 16
- Redis 7

### Local Development

1. **Clone repository**
   ```bash
   git clone https://github.com/kirolosshenoda/shiny-octo-succotash.git
   cd shiny-octo-succotash
Install dependencies

bash
pnpm install
Setup environment

bash
cp .env.example .env
# Edit .env with your configuration
Start services with Docker

bash
docker-compose up -d
Setup database

bash
pnpm db:push
pnpm db:seed
Start development servers

bash
pnpm dev
Services will be available at:

Web App: http://localhost:3000
API: http://localhost:3001
Prisma Studio: http://localhost:5555
📦 Available Scripts
bash
# Development
pnpm dev          # Start all dev servers
pnpm build        # Build all apps
pnpm test         # Run tests
pnpm lint         # Lint all code
pnpm format       # Format code with Prettier

# Database
pnpm db:push      # Push schema to database
pnpm db:migrate   # Create new migration
pnpm db:seed      # Seed database with sample data
pnpm db:studio    # Open Prisma Studio
🗺️ Development Roadmap
Sprint 1: Foundation
Landing page
Authentication system
Database setup
Creator & brand onboarding
Sprint 2: Dashboards
Creator dashboard
Brand dashboard
Admin dashboard
Sprint 3: Marketplace
Creator marketplace
Campaign creation
Applications system
Portfolio showcase
Sprint 4: Communication
Messaging system
Notifications
Reviews & ratings
Search functionality
Sprint 5: Payments
Spotless Pay escrow
Stripe Connect integration
Wallet system
Payout management
Sprint 6: AI & Analytics
AI creator matching
AI brief generator
AI script writer
Advanced analytics
📊 Estimated Scope
250+ screens across all portals
70 database tables for all features
150+ API endpoints
350,000+ lines of production code
🔐 Security
HTTPS/TLS encryption
JWT token-based auth
SQL injection prevention (Prisma ORM)
XSS/CSRF protection
Rate limiting
Data encryption at rest & in transit
PCI DSS compliance for payments
📝 Contributing
Contributions are welcome! Please follow our code style guide and submit pull requests to the appropriate branch.

📄 License
MIT License - See LICENSE file for details

🤝 Support
For support, email support@ugcgulf.com or open an issue on GitHub.

🎯 Future Roadmap
Beyond MVP, UGC GULF will evolve into a creator operating system with:

AI creator assistant
Smart contracts
Auto invoicing
Creator & Brand CRM
Referral system
Learning academy
Community features
Mobile app
Chrome extension
Public API
Code
apps/.gitkeep

gitkeep
packages/.gitkeep

gitkeep
.github/workflows/ci.yml

yml
name: CI

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main, develop]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v2
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'pnpm'
      - run: pnpm install
      - run: pnpm lint

  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v2
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'pnpm'
      - run: pnpm install
      - run: pnpm test

  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v2
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'pnpm'
      - run: pnpm install
      - run: pnpm build

docs/ARCHITECTURE.md

md
# UGC GULF Architecture Documentation

## System Overview

UGC GULF is a monorepo-based SaaS platform built with modern web technologies. The system consists of three main applications:

1. **Web App** (Next.js): Creator & Brand portals
2. **Admin App** (Next.js): Administrative dashboard
3. **API** (NestJS): Backend services

Supported by shared packages for common functionality.

## Architecture Layers

### Presentation Layer
- **Frontend Framework**: Next.js 15 with React 19
- **Styling**: Tailwind CSS v4
- **UI Components**: shadcn/ui + custom components
- **Animations**: Framer Motion
- **State Management**: React Context + SWR/TanStack Query

### Business Logic Layer
- **Backend Framework**: NestJS
- **API Pattern**: RESTful with OpenAPI/Swagger docs
- **Authentication**: JWT + Refresh tokens
- **Authorization**: Role-based access control (RBAC)

### Data Layer
- **ORM**: Prisma
- **Database**: PostgreSQL
- **Caching**: Redis
- **Job Queue**: BullMQ + Redis

### External Services
- **Auth**: Auth.js (Google, Apple, Email/Password)
- **Storage**: AWS S3 / Cloudflare R2
- **Payments**: Stripe Connect
- **AI**: Claude API, OpenAI
- **Email**: Resend or SendGrid
- **CDN**: Cloudflare

## Data Flow

┌─────────────────┐ │ User Client │ │ (Browser) │ └────────┬────────┘ │ HTTP/HTTPS ▼ ┌─────────────────────────────────────┐ │ Next.js Frontend (Web/Admin) │ │ - Server Components │ │ - Client Components │ │ - API Routes (Middleware) │ └────────┬────────────────────────────┘ │ REST API ▼ ┌─────────────────────────────────────┐ │ NestJS Backend (API) │ │ - Controllers │ │ - Services │ │ - Guards & Middleware │ └────────┬────────────────────────────┘ │ ┌────┴──────────────────────────┐ ▼ ▼ ┌─────────────┐ ┌──────────────────┐ │ PostgreSQL │ │ Redis (Cache) │ │ - Users │ │ - Sessions │ │ - Campaigns │ │ - Tokens │ │ - Reviews │ │ - Rate Limits │ └─────────────┘ └──────────────────┘ │ ▼ ┌──────────────────┐ │ BullMQ (Jobs) │ │ - Email sends │ │ - Payments │ │ - Notifications │ └──────────────────┘

Code

## Database Schema Overview

### Core Tables
- `users` - User accounts (creators, brands, admins)
- `profiles` - User profile data
- `creators` - Creator-specific data
- `brands` - Brand-specific data
- `portfolios` - Creator portfolios
- `campaigns` - Brand campaigns
- `applications` - Creator applications to campaigns
- `submissions` - Campaign submissions from creators
- `reviews` - Reviews and ratings
- `payments` - Payment records
- `wallets` - User wallet balances
- `notifications` - System notifications

## API Design

### REST Endpoints Structure
/api/v1/ ├── /auth │ ├── POST /register │ ├── POST /login │ ├── POST /refresh │ └── POST /logout ├── /users │ ├── GET /:id │ ├── PUT /:id │ └── DELETE /:id ├── /creators │ ├── GET │ ├── GET /:id │ └── POST ├── /brands │ ├── GET │ ├── GET /:id │ └── POST ├── /campaigns │ ├── GET │ ├── GET /:id │ ├── POST │ └── PUT /:id └── /payments ├── POST /stripe/webhook └── GET /transactions

Code

## Authentication Flow

1. User signs up via email or OAuth (Google/Apple)
2. Email verification email sent
3. User creates profile (creator/brand)
4. JWT token issued + refresh token stored
5. Frontend stores JWT in httpOnly cookie
6. All API requests include JWT in Authorization header
7. Backend validates JWT and enforces permissions

## Deployment Architecture

### Development
- Local machine with Docker Compose
- PostgreSQL + Redis running locally

### Staging
- Vercel for frontend preview deployments
- Railway for API staging
- Staging PostgreSQL database
- Redis cache

### Production
- **Frontend**: Vercel with CDN
- **Backend**: Railway/Fly.io with auto-scaling
- **Database**: AWS RDS PostgreSQL (Multi-AZ)
- **Cache**: ElastiCache Redis
- **Storage**: AWS S3 + CloudFront CDN
- **Email**: Resend or SendGrid

## Security Considerations

1. **Authentication**
   - JWT tokens with short expiry (15 min)
   - Refresh tokens stored in secure httpOnly cookies
   - Rate limiting on auth endpoints

2. **Authorization**
   - Role-based access control (RBAC)
   - Resource-level permissions
   - Team/organization scoping

3. **Data Protection**
   - Encryption at rest (database)
   - Encryption in transit (TLS)
   - Sensitive data hashing

4. **API Security**
   - CORS configuration
   - CSRF protection
   - Input validation
   - SQL injection prevention (Prisma ORM)

## Scalability Strategy

1. **Horizontal Scaling**
   - Stateless API servers
   - Load balancer (Vercel/Railway handle this)
   - Database read replicas

2. **Caching**
   - Redis for session storage
   - Query result caching
   - CDN for static assets

3. **Database**
   - Connection pooling (Prisma)
   - Indexed queries
   - Archival of old data

4. **Job Processing**
   - BullMQ for async tasks
   - Multiple worker processes
   - Priority queues

## Monitoring & Logging

- Application logs: Winston/Pino
- Error tracking: Sentry
- Performance monitoring: Vercel Analytics
- Database monitoring: Railway metrics
- Custom dashboards: Grafana (optional)

docs/API.md

md
# UGC GULF API Documentation

## Overview

The UGC GULF API is a RESTful service built with NestJS, providing endpoints for the web and admin applications.

## Base URL

Development: http://localhost:3001/api/v1 Production: https://api.ugcgulf.com/api/v1

Code

## Authentication

All API requests (except public endpoints) require authentication via JWT token in the Authorization header:

Authorization: Bearer <jwt_token>

Code

## Response Format

All responses follow a consistent format:

```json
{
  "success": true,
  "data": { /* endpoint-specific data */ },
  "error": null,
  "timestamp": "2024-01-15T10:30:00Z"
}
Errors:

JSON
{
  "success": false,
  "data": null,
  "error": {
    "code": "INVALID_EMAIL",
    "message": "Email address is invalid",
    "details": {}
  },
  "timestamp": "2024-01-15T10:30:00Z"
}
Public Endpoints
Authentication
Register
HTTP
POST /auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "SecurePassword123!",
  "firstName": "John",
  "lastName": "Doe",
  "userType": "creator" | "brand" | "admin"
}

Response: 201 Created
{
  "success": true,
  "data": {
    "id": "user_123",
    "email": "user@example.com",
    "token": "eyJhbGc...",
    "refreshToken": "eyJhbGc..."
  }
}
Login
HTTP
POST /auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "SecurePassword123!"
}

Response: 200 OK
{
  "success": true,
  "data": {
    "user": {
      "id": "user_123",
      "email": "user@example.com",
      "userType": "creator"
    },
    "token": "eyJhbGc...",
    "refreshToken": "eyJhbGc..."
  }
}
Refresh Token
HTTP
POST /auth/refresh
Content-Type: application/json

{
  "refreshToken": "eyJhbGc..."
}

Response: 200 OK
{
  "success": true,
  "data": {
    "token": "eyJhbGc...",
    "refreshToken": "eyJhbGc..."
  }
}
Protected Endpoints
User Profile
Get Current User
HTTP
GET /users/me
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": {
    "id": "user_123",
    "email": "user@example.com",
    "firstName": "John",
    "lastName": "Doe",
    "userType": "creator",
    "avatar": "https://...",
    "createdAt": "2024-01-15T10:00:00Z"
  }
}
Update Profile
HTTP
PUT /users/:id
Authorization: Bearer <token>
Content-Type: application/json

{
  "firstName": "Jane",
  "lastName": "Smith",
  "bio": "Professional UGC creator"
}

Response: 200 OK
Creators
List Creators
HTTP
GET /creators?skip=0&take=20&search=&sort=trending
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": {
    "creators": [
      {
        "id": "creator_1",
        "name": "John Doe",
        "avatar": "https://...",
        "bio": "Tech reviewer",
        "category": "tech",
        "followers": 50000,
        "rating": 4.8,
        "portfolioCount": 25
      }
    ],
    "total": 1000,
    "page": 0,
    "pageSize": 20
  }
}
Get Creator Profile
HTTP
GET /creators/:id
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": {
    "id": "creator_1",
    "user": { /* user data */ },
    "bio": "Professional UGC creator",
    "category": "tech",
    "rating": 4.8,
    "totalEarnings": 25000,
    "completedCampaigns": 45,
    "portfolio": [ /* portfolio items */ ],
    "reviews": [ /* reviews */ ]
  }
}
Campaigns
Create Campaign
HTTP
POST /campaigns
Authorization: Bearer <token>
Content-Type: application/json

{
  "title": "Product Review Campaign",
  "description": "We need UGC creators to review our new product",
  "budget": 5000,
  "numberOfPositions": 10,
  "deadline": "2024-02-15T23:59:59Z",
  "category": "tech",
  "requirements": {
    "minFollowers": 10000,
    "minRating": 4.0,
    "platforms": ["tiktok", "instagram"]
  },
  "deliverables": {
    "type": "video",
    "duration": "30-60 seconds",
    "quantity": 3
  }
}

Response: 201 Created
{
  "success": true,
  "data": {
    "id": "campaign_123",
    "status": "draft"
  }
}
Get Campaign
HTTP
GET /campaigns/:id
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": { /* full campaign details */ }
}
List Campaigns
HTTP
GET /campaigns?status=active&skip=0&take=20
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": {
    "campaigns": [ /* array of campaigns */ ],
    "total": 100,
    "page": 0,
    "pageSize": 20
  }
}
Applications
Apply for Campaign
HTTP
POST /applications
Authorization: Bearer <token>
Content-Type: application/json

{
  "campaignId": "campaign_123",
  "message": "I'm interested in this campaign!",
  "portfolioItems": ["portfolio_1", "portfolio_2"]
}

Response: 201 Created
{
  "success": true,
  "data": {
    "id": "application_123",
    "status": "pending"
  }
}
Get Applications
HTTP
GET /applications?campaignId=campaign_123
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": {
    "applications": [ /* applications */ ],
    "total": 50
  }
}
Payments
Get Wallet Balance
HTTP
GET /payments/wallet
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": {
    "balance": 2500.00,
    "currency": "AED",
    "pendingEarnings": 1500.00
  }
}
Get Transaction History
HTTP
GET /payments/transactions?skip=0&take=20
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": {
    "transactions": [ /* transactions */ ],
    "total": 150
  }
}
Error Codes
Code	Status	Description
INVALID_EMAIL	400	Email format is invalid
EMAIL_EXISTS	409	Email already registered
INVALID_PASSWORD	400	Password does not meet requirements
AUTH_FAILED	401	Authentication failed
TOKEN_EXPIRED	401	JWT token has expired
FORBIDDEN	403	Access denied
NOT_FOUND	404	Resource not found
CONFLICT	409	Resource conflict
RATE_LIMIT	429	Too many requests
SERVER_ERROR	500	Internal server error
Rate Limiting
100 requests per 15 minutes for unauthenticated endpoints
500 requests per 15 minutes for authenticated endpoints
Headers returned:
X-RateLimit-Limit
X-RateLimit-Remaining
X-RateLimit-Reset
Code
Please confirm you want Copilot to push 16 files to branch feat/ugc-gulf-setup in kirolosshenoda/shiny-octo-succotash.

 kirolosshenoda accepted the action
Let me fix that by removing the empty .gitkeep files:

ok
We're waiting for your confirmation to push Commit 1 with all foundation files to the feat/ugc-gulf-setup branch.

Make these code changes?
package.json

JSON
{
  "name": "ugc-gulf",
  "version": "0.1.0",
  "private": true,
  "type": "module",
  "scripts": {
    "dev": "turbo run dev",
    "build": "turbo run build",
    "test": "turbo run test",
    "lint": "turbo run lint",
    "format": "prettier --write \"**/*.{ts,tsx,json,md}\"",
    "format:check": "prettier --check \"**/*.{ts,tsx,json,md}\"",
    "db:push": "cd apps/api && prisma db push",
    "db:migrate": "cd apps/api && prisma migrate dev",
    "db:seed": "cd apps/api && ts-node prisma/seed.ts",
    "db:studio": "cd apps/api && prisma studio"
  },
  "devDependencies": {
    "@types/node": "^20.10.0",
    "@typescript-eslint/eslint-plugin": "^6.13.0",
    "@typescript-eslint/parser": "^6.13.0",
    "eslint": "^8.54.0",
    "eslint-config-prettier": "^9.1.0",
    "prettier": "^3.1.0",
    "turbo": "^1.10.16",
    "typescript": "^5.3.3"
  },
  "engines": {
    "node": ">=20.0.0",
    "pnpm": ">=8.0.0"
  }
}

pnpm-workspace.yaml

YAML
packages:
  - 'apps/*'
  - 'packages/*'

turbo.json

JSON
{
  "$schema": "https://turborepo.org/schema.json",
  "globalDependencies": [".env", ".env.local"],
  "tasks": {
    "dev": {
      "cache": false,
      "interactive": true
    },
    "build": {
      "outputs": [".next", "dist", "build"],
      "dependsOn": ["^build"]
    },
    "lint": {
      "outputs": []
    },
    "test": {
      "outputs": ["coverage"],
      "cache": false
    }
  }
}

tsconfig.json

JSON
{
  "compilerOptions": {
    "target": "ES2020",
    "useDefineForClassFields": true,
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "skipLibCheck": true,
    "esModuleInterop": true,
    "allowSyntheticDefaultImports": true,
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true,
    "resolveJsonModule": true,
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "noEmit": true,
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"],
      "@web/*": ["./apps/web/src/*"],
      "@api/*": ["./apps/api/src/*"],
      "@admin/*": ["./apps/admin/src/*"],
      "@ui/*": ["./packages/ui/src/*"],
      "@db/*": ["./packages/database/src/*"],
      "@auth/*": ["./packages/auth/src/*"],
      "@payments/*": ["./packages/payments/src/*"],
      "@ai/*": ["./packages/ai/src/*"],
      "@shared/*": ["./packages/shared/src/*"]
    }
  },
  "include": ["**/*.ts", "**/*.tsx"],
  "exclude": ["node_modules", "dist"]
}

.eslintrc.json

JSON
{
  "root": true,
  "parser": "@typescript-eslint/parser",
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "prettier"
  ],
  "plugins": ["@typescript-eslint"],
  "env": {
    "node": true,
    "browser": true,
    "es2021": true
  },
  "rules": {
    "@typescript-eslint/no-unused-vars": [
      "error",
      {
        "argsIgnorePattern": "^_",
        "varsIgnorePattern": "^_"
      }
    ],
    "@typescript-eslint/explicit-function-return-types": [
      "warn",
      {
        "allowExpressions": true
      }
    ]
  }
}

.prettierrc.json

JSON
{
  "semi": true,
  "trailingComma": "es5",
  "singleQuote": true,
  "printWidth": 100,
  "tabWidth": 2,
  "useTabs": false,
  "arrowParens": "always"
}

.gitignore

gitignore
# Dependencies
node_modules/
.pnp
.pnp.js

# Testing
coverage/

# Production
build/
dist/
.next/
out/

# Misc
.DS_Store
*.pem
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Debug
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# IDE
.vscode/
.idea/
*.swp
*.swo
*~
.project
.classpath
.c9/
*.launch
.settings/
*.sublime-workspace

# OS
Thumbs.db
.Spotlight-V100
.Trashes

# Turbo
.turbo/

# Prisma
prisma/dev.db
prisma/dev.db-journal

.env.example

example
# Database
DATABASE_URL="postgresql://user:password@localhost:5432/ugc_gulf_dev"

# Redis
REDIS_URL="redis://localhost:6379"

# Next.js
NEXT_PUBLIC_API_URL="http://localhost:3001"
NEXT_PUBLIC_APP_URL="http://localhost:3000"

# Auth
NEXT_PUBLIC_AUTH_URL="http://localhost:3000"
AUTH_SECRET="your-secret-key-here-change-in-production"

# OAuth
GOOGLE_ID="your-google-client-id"
GOOGLE_SECRET="your-google-client-secret"
APPLE_ID="your-apple-client-id"
APPLE_SECRET="your-apple-client-secret"

# Email
SMTP_HOST="smtp.resend.com"
SMTP_PORT="465"
SMTP_USER="resend"
SMTP_PASS="your-resend-api-key"
SMTP_FROM="noreply@ugcgulf.com"

# Storage
AWS_REGION="us-east-1"
AWS_ACCESS_KEY_ID="your-aws-access-key"
AWS_SECRET_ACCESS_KEY="your-aws-secret-key"
AWS_S3_BUCKET="ugc-gulf-storage"

# Payments
STRIPE_PUBLIC_KEY="pk_test_..."
STRIPE_SECRET_KEY="sk_test_..."
STRIPE_WEBHOOK_SECRET="whsec_..."

# AI
OPENAI_API_KEY="sk-..."
CLAUDE_API_KEY="sk-ant-..."

# Analytics
NEXT_PUBLIC_GA_ID="G-..."

# Logging
LOG_LEVEL="debug"

Dockerfile

Dockerfile
# Build stage
FROM node:20-alpine AS builder

WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

# Copy workspace files
COPY pnpm-workspace.yaml .
COPY package.json .
COPY turbo.json .

# Copy all packages and apps
COPY packages ./packages
COPY apps ./apps

# Install dependencies
RUN pnpm install --frozen-lockfile

# Build
RUN pnpm build

# Runtime stage
FROM node:20-alpine

WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

# Copy from builder
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/apps ./apps
COPY --from=builder /app/packages ./packages
COPY --from=builder /app/package.json .
COPY --from=builder /app/turbo.json .
COPY --from=builder /app/pnpm-workspace.yaml .

EXPOSE 3000 3001

CMD ["pnpm", "dev"]

docker-compose.yml

yml
version: '3.8'

services:
  postgres:
    image: postgres:16-alpine
    container_name: ugc-gulf-postgres
    environment:
      POSTGRES_USER: ugc_user
      POSTGRES_PASSWORD: ugc_password_dev
      POSTGRES_DB: ugc_gulf_dev
    ports:
      - '5432:5432'
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ['CMD-SHELL', 'pg_isready -U ugc_user']
      interval: 10s
      timeout: 5s
      retries: 5

  redis:
    image: redis:7-alpine
    container_name: ugc-gulf-redis
    ports:
      - '6379:6379'
    volumes:
      - redis_data:/data
    healthcheck:
      test: ['CMD', 'redis-cli', 'ping']
      interval: 10s
      timeout: 5s
      retries: 5

  app:
    build: .
    container_name: ugc-gulf-app
    environment:
      DATABASE_URL: postgresql://ugc_user:ugc_password_dev@postgres:5432/ugc_gulf_dev
      REDIS_URL: redis://redis:6379
      NODE_ENV: development
      NEXT_PUBLIC_API_URL: http://localhost:3001
      NEXT_PUBLIC_APP_URL: http://localhost:3000
    ports:
      - '3000:3000'
      - '3001:3001'
    depends_on:
      postgres:
        condition: service_healthy
      redis:
        condition: service_healthy
    volumes:
      - .:/app
      - /app/node_modules

volumes:
  postgres_data:
  redis_data:

README.md

md
# UGC GULF - User Generated Content Platform for Gulf Region

A comprehensive SaaS platform connecting UGC creators with brands for authentic product reviews and marketing campaigns.

## 🚀 Overview

UGC GULF is a full-stack marketplace platform with three main portals:

- **Creator Portal**: Showcase portfolio, apply for campaigns, earn money
- **Brand Portal**: Create campaigns, review applications, manage escrow payments
- **Admin Portal**: Manage users, content moderation, analytics, payouts

## 📋 Tech Stack

### Frontend
- **Next.js 15** with React 19
- **TypeScript** for type safety
- **Tailwind CSS v4** for styling
- **shadcn/ui** for component library
- **Framer Motion** for animations

### Backend
- **NestJS** for API
- **Prisma ORM** for database
- **PostgreSQL** for data storage
- **Redis** for caching & queues
- **BullMQ** for job processing

### Authentication
- **Auth.js** with NextAuth
- OAuth: Google, Apple
- Email/Password with JWT

### Storage & CDN
- **AWS S3** or **Cloudflare R2** for media
- **Cloudflare CDN** for global distribution

### Payments
- **Stripe Connect** for payouts
- **Spotless Pay** escrow system
- Wallet & balance management

### AI
- **Claude AI** for creator matching
- **OpenAI** for content generation
- Campaign brief generator
- Script writer assistant

### Infrastructure
- **Docker** for containerization
- **GitHub Actions** for CI/CD
- **Vercel** for frontend hosting
- **Railway/Fly.io** for backend

## 📁 Project Structure

ugc-gulf/ ├── apps/ │ ├── web/ # Creator & Brand frontend (Next.js) │ ├── admin/ # Admin dashboard (Next.js) │ └── api/ # Backend API (NestJS) ├── packages/ │ ├── ui/ # Shared UI components │ ├── database/ # Prisma schemas & migrations │ ├── auth/ # Authentication logic │ ├── payments/ # Payment processing │ ├── ai/ # AI integrations │ └── shared/ # Shared utilities & types ├── prisma/ # Database schema & migrations ├── docs/ # Documentation └── docker/ # Docker configuration

Code

## 🛠️ Setup & Installation

### Prerequisites
- Node.js 20+
- pnpm 8+
- Docker & Docker Compose
- PostgreSQL 16
- Redis 7

### Local Development

1. **Clone repository**
   ```bash
   git clone https://github.com/kirolosshenoda/shiny-octo-succotash.git
   cd shiny-octo-succotash
Install dependencies

bash
pnpm install
Setup environment

bash
cp .env.example .env
# Edit .env with your configuration
Start services with Docker

bash
docker-compose up -d
Setup database

bash
pnpm db:push
pnpm db:seed
Start development servers

bash
pnpm dev
Services will be available at:

Web App: http://localhost:3000
API: http://localhost:3001
Prisma Studio: http://localhost:5555
📦 Available Scripts
bash
# Development
pnpm dev          # Start all dev servers
pnpm build        # Build all apps
pnpm test         # Run tests
pnpm lint         # Lint all code
pnpm format       # Format code with Prettier

# Database
pnpm db:push      # Push schema to database
pnpm db:migrate   # Create new migration
pnpm db:seed      # Seed database with sample data
pnpm db:studio    # Open Prisma Studio
🗺️ Development Roadmap
Sprint 1: Foundation
Landing page
Authentication system
Database setup
Creator & brand onboarding
Sprint 2: Dashboards
Creator dashboard
Brand dashboard
Admin dashboard
Sprint 3: Marketplace
Creator marketplace
Campaign creation
Applications system
Portfolio showcase
Sprint 4: Communication
Messaging system
Notifications
Reviews & ratings
Search functionality
Sprint 5: Payments
Spotless Pay escrow
Stripe Connect integration
Wallet system
Payout management
Sprint 6: AI & Analytics
AI creator matching
AI brief generator
AI script writer
Advanced analytics
📊 Estimated Scope
250+ screens across all portals
70 database tables for all features
150+ API endpoints
350,000+ lines of production code
🔐 Security
HTTPS/TLS encryption
JWT token-based auth
SQL injection prevention (Prisma ORM)
XSS/CSRF protection
Rate limiting
Data encryption at rest & in transit
PCI DSS compliance for payments
🤝 Contributing
Contributions are welcome! Please follow our code style guide and submit pull requests to the appropriate branch.

📄 License
MIT License - See LICENSE file for details

🤝 Support
For support, email support@ugcgulf.com or open an issue on GitHub.

🎯 Future Roadmap
Beyond MVP, UGC GULF will evolve into a creator operating system with:

AI creator assistant
Smart contracts
Auto invoicing
Creator & Brand CRM
Referral system
Learning academy
Community features
Mobile app
Chrome extension
Public API
Code
.github/workflows/ci.yml

yml
name: CI

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main, develop]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v2
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'pnpm'
      - run: pnpm install
      - run: pnpm lint

  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v2
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'pnpm'
      - run: pnpm install
      - run: pnpm test

  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v2
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'pnpm'
      - run: pnpm install
      - run: pnpm build

docs/ARCHITECTURE.md

md
# UGC GULF Architecture Documentation

## System Overview

UGC GULF is a monorepo-based SaaS platform built with modern web technologies. The system consists of three main applications:

1. **Web App** (Next.js): Creator & Brand portals
2. **Admin App** (Next.js): Administrative dashboard
3. **API** (NestJS): Backend services

Supported by shared packages for common functionality.

## Architecture Layers

### Presentation Layer
- **Frontend Framework**: Next.js 15 with React 19
- **Styling**: Tailwind CSS v4
- **UI Components**: shadcn/ui + custom components
- **Animations**: Framer Motion
- **State Management**: React Context + SWR/TanStack Query

### Business Logic Layer
- **Backend Framework**: NestJS
- **API Pattern**: RESTful with OpenAPI/Swagger docs
- **Authentication**: JWT + Refresh tokens
- **Authorization**: Role-based access control (RBAC)

### Data Layer
- **ORM**: Prisma
- **Database**: PostgreSQL
- **Caching**: Redis
- **Job Queue**: BullMQ + Redis

### External Services
- **Auth**: Auth.js (Google, Apple, Email/Password)
- **Storage**: AWS S3 / Cloudflare R2
- **Payments**: Stripe Connect
- **AI**: Claude API, OpenAI
- **Email**: Resend or SendGrid
- **CDN**: Cloudflare

## Data Flow

┌──────────────────────────┐ │ User Client │ │ (Browser) │ └──────────────┬───────────┘ │ HTTP/HTTPS ▼ ┌────────────────────────────────────────────────────────────────┐ │ Next.js Frontend (Web/Admin) │ │ - Server Components │ │ - Client Components │ │ - API Routes (Middleware) │ └──────────────┬───────────────────────────────────────────────┘ │ REST API ▼ ┌────────────────────────────────────────────────────────────────┐ │ NestJS Backend (API) │ │ - Controllers │ │ - Services │ │ - Guards & Middleware │ └──────────────┬───────────────────────────────────────────────┘ │ ┌────┴──────────────────────────────────────────────┐ ▼ ▼ ┌──────────────────────┐ ┌──────────────────────┐ │ PostgreSQL │ │ Redis (Cache) │ │ - Users │ │ - Sessions │ │ - Campaigns │ │ - Tokens │ │ - Reviews │ │ - Rate Limits │ └──────────────────────┘ └──────────────────────┘ │ ▼ ┌──────────────────────────────┐ │ BullMQ (Jobs) │ │ - Email sends │ │ - Payments │ │ - Notifications │ └──────────────────────────────┘

Code

## Database Schema Overview

### Core Tables
- `users` - User accounts (creators, brands, admins)
- `profiles` - User profile data
- `creators` - Creator-specific data
- `brands` - Brand-specific data
- `portfolios` - Creator portfolios
- `campaigns` - Brand campaigns
- `applications` - Creator applications to campaigns
- `submissions` - Campaign submissions from creators
- `reviews` - Reviews and ratings
- `payments` - Payment records
- `wallets` - User wallet balances
- `notifications` - System notifications

## API Design

### REST Endpoints Structure
/api/v1/ ├── /auth │ ├── POST /register │ ├── POST /login │ ├── POST /refresh │ └── POST /logout ├── /users │ ├── GET /:id │ ├── PUT /:id │ └── DELETE /:id ├── /creators │ ├── GET │ ├── GET /:id │ └── POST ├── /brands │ ├── GET │ ├── GET /:id │ └── POST ├── /campaigns │ ├── GET │ ├── GET /:id │ ├── POST │ └── PUT /:id └── /payments ├── POST /stripe/webhook └── GET /transactions

Code

## Authentication Flow

1. User signs up via email or OAuth (Google/Apple)
2. Email verification email sent
3. User creates profile (creator/brand)
4. JWT token issued + refresh token stored
5. Frontend stores JWT in httpOnly cookie
6. All API requests include JWT in Authorization header
7. Backend validates JWT and enforces permissions

## Deployment Architecture

### Development
- Local machine with Docker Compose
- PostgreSQL + Redis running locally

### Staging
- Vercel for frontend preview deployments
- Railway for API staging
- Staging PostgreSQL database
- Redis cache

### Production
- **Frontend**: Vercel with CDN
- **Backend**: Railway/Fly.io with auto-scaling
- **Database**: AWS RDS PostgreSQL (Multi-AZ)
- **Cache**: ElastiCache Redis
- **Storage**: AWS S3 + CloudFront CDN
- **Email**: Resend or SendGrid

## Security Considerations

1. **Authentication**
   - JWT tokens with short expiry (15 min)
   - Refresh tokens stored in secure httpOnly cookies
   - Rate limiting on auth endpoints

2. **Authorization**
   - Role-based access control (RBAC)
   - Resource-level permissions
   - Team/organization scoping

3. **Data Protection**
   - Encryption at rest (database)
   - Encryption in transit (TLS)
   - Sensitive data hashing

4. **API Security**
   - CORS configuration
   - CSRF protection
   - Input validation
   - SQL injection prevention (Prisma ORM)

## Scalability Strategy

1. **Horizontal Scaling**
   - Stateless API servers
   - Load balancer (Vercel/Railway handle this)
   - Database read replicas

2. **Caching**
   - Redis for session storage
   - Query result caching
   - CDN for static assets

3. **Database**
   - Connection pooling (Prisma)
   - Indexed queries
   - Archival of old data

4. **Job Processing**
   - BullMQ for async tasks
   - Multiple worker processes
   - Priority queues

## Monitoring & Logging

- Application logs: Winston/Pino
- Error tracking: Sentry
- Performance monitoring: Vercel Analytics
- Database monitoring: Railway metrics
- Custom dashboards: Grafana (optional)

docs/API.md

md
# UGC GULF API Documentation

## Overview

The UGC GULF API is a RESTful service built with NestJS, providing endpoints for the web and admin applications.

## Base URL

Development: http://localhost:3001/api/v1 Production: https://api.ugcgulf.com/api/v1

Code

## Authentication

All API requests (except public endpoints) require authentication via JWT token in the Authorization header:

Authorization: Bearer <jwt_token>

Code

## Response Format

All responses follow a consistent format:

```json
{
  "success": true,
  "data": { /* endpoint-specific data */ },
  "error": null,
  "timestamp": "2024-01-15T10:30:00Z"
}
Errors:

JSON
{
  "success": false,
  "data": null,
  "error": {
    "code": "INVALID_EMAIL",
    "message": "Email address is invalid",
    "details": {}
  },
  "timestamp": "2024-01-15T10:30:00Z"
}
Public Endpoints
Authentication
Register
HTTP
POST /auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "SecurePassword123!",
  "firstName": "John",
  "lastName": "Doe",
  "userType": "creator" | "brand" | "admin"
}

Response: 201 Created
{
  "success": true,
  "data": {
    "id": "user_123",
    "email": "user@example.com",
    "token": "eyJhbGc...",
    "refreshToken": "eyJhbGc..."
  }
}
Login
HTTP
POST /auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "SecurePassword123!"
}

Response: 200 OK
{
  "success": true,
  "data": {
    "user": {
      "id": "user_123",
      "email": "user@example.com",
      "userType": "creator"
    },
    "token": "eyJhbGc...",
    "refreshToken": "eyJhbGc..."
  }
}
Refresh Token
HTTP
POST /auth/refresh
Content-Type: application/json

{
  "refreshToken": "eyJhbGc..."
}

Response: 200 OK
{
  "success": true,
  "data": {
    "token": "eyJhbGc...",
    "refreshToken": "eyJhbGc..."
  }
}
Protected Endpoints
User Profile
Get Current User
HTTP
GET /users/me
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": {
    "id": "user_123",
    "email": "user@example.com",
    "firstName": "John",
    "lastName": "Doe",
    "userType": "creator",
    "avatar": "https://...",
    "createdAt": "2024-01-15T10:00:00Z"
  }
}
Update Profile
HTTP
PUT /users/:id
Authorization: Bearer <token>
Content-Type: application/json

{
  "firstName": "Jane",
  "lastName": "Smith",
  "bio": "Professional UGC creator"
}

Response: 200 OK
Creators
List Creators
HTTP
GET /creators?skip=0&take=20&search=&sort=trending
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": {
    "creators": [
      {
        "id": "creator_1",
        "name": "John Doe",
        "avatar": "https://...",
        "bio": "Tech reviewer",
        "category": "tech",
        "followers": 50000,
        "rating": 4.8,
        "portfolioCount": 25
      }
    ],
    "total": 1000,
    "page": 0,
    "pageSize": 20
  }
}
Get Creator Profile
HTTP
GET /creators/:id
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": {
    "id": "creator_1",
    "user": { /* user data */ },
    "bio": "Professional UGC creator",
    "category": "tech",
    "rating": 4.8,
    "totalEarnings": 25000,
    "completedCampaigns": 45,
    "portfolio": [ /* portfolio items */ ],
    "reviews": [ /* reviews */ ]
  }
}
Campaigns
Create Campaign
HTTP
POST /campaigns
Authorization: Bearer <token>
Content-Type: application/json

{
  "title": "Product Review Campaign",
  "description": "We need UGC creators to review our new product",
  "budget": 5000,
  "numberOfPositions": 10,
  "deadline": "2024-02-15T23:59:59Z",
  "category": "tech",
  "requirements": {
    "minFollowers": 10000,
    "minRating": 4.0,
    "platforms": ["tiktok", "instagram"]
  },
  "deliverables": {
    "type": "video",
    "duration": "30-60 seconds",
    "quantity": 3
  }
}

Response: 201 Created
{
  "success": true,
  "data": {
    "id": "campaign_123",
    "status": "draft"
  }
}
Get Campaign
HTTP
GET /campaigns/:id
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": { /* full campaign details */ }
}
List Campaigns
HTTP
GET /campaigns?status=active&skip=0&take=20
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": {
    "campaigns": [ /* array of campaigns */ ],
    "total": 100,
    "page": 0,
    "pageSize": 20
  }
}
Applications
Apply for Campaign
HTTP
POST /applications
Authorization: Bearer <token>
Content-Type: application/json

{
  "campaignId": "campaign_123",
  "message": "I'm interested in this campaign!",
  "portfolioItems": ["portfolio_1", "portfolio_2"]
}

Response: 201 Created
{
  "success": true,
  "data": {
    "id": "application_123",
    "status": "pending"
  }
}
Get Applications
HTTP
GET /applications?campaignId=campaign_123
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": {
    "applications": [ /* applications */ ],
    "total": 50
  }
}
Payments
Get Wallet Balance
HTTP
GET /payments/wallet
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": {
    "balance": 2500.00,
    "currency": "AED",
    "pendingEarnings": 1500.00
  }
}
Get Transaction History
HTTP
GET /payments/transactions?skip=0&take=20
Authorization: Bearer <token>

Response: 200 OK
{
  "success": true,
  "data": {
    "transactions": [ /* transactions */ ],
    "total": 150
  }
}
Error Codes
Code	Status	Description
INVALID_EMAIL	400	Email format is invalid
EMAIL_EXISTS	409	Email already registered
INVALID_PASSWORD	400	Password does not meet requirements
AUTH_FAILED	401	Authentication failed
TOKEN_EXPIRED	401	JWT token has expired
FORBIDDEN	403	Access denied
NOT_FOUND	404	Resource not found
CONFLICT	409	Resource conflict
RATE_LIMIT	429	Too many requests
SERVER_ERROR	500	Internal server error
Rate Limiting
100 requests per 15 minutes for unauthenticated endpoints
500 requests per 15 minutes for authenticated endpoints
Headers returned:
X-RateLimit-Limit
X-RateLimit-Remaining
X-RateLimit-Reset
Code
Please confirm you want Copilot to push 14 files to branch feat/ugc-gulf-setup in kirolosshenoda/shiny-octo-succotash.

 kirolosshenoda accepted the action
I see there's a permission issue. The branch exists but I cannot push files to the repository. This could be due to:

Access restrictions - The repository might have branch protection rules
Account permissions - Your account may not have write access to this repository
Authentication - The credentials need to be verified
Next steps:

Verify you have push access to kirolosshenoda/shiny-octo-succotash
Check if the feat/ugc-gulf-setup branch has protection rules
Ensure your GitHub account has contributor access to the repository
Once permissions are confirmed, I can push all the foundation files for Commit 1, which includes:

✅ Configuration files (tsconfig, eslint, prettier)
✅ Docker & Docker Compose setup
✅ Package management (pnpm-workspace, turbo)
✅ Environment template (.env.example)
✅ Documentation (README, Architecture, API docs)
✅ GitHub Actions CI/CD workflow
