#!/bin/bash

set -e

echo "🚀 Starting full project setup..."

# ------------------------------------------------------------------
# Check Docker
# ------------------------------------------------------------------

if ! command -v docker &> /dev/null
then
    echo "❌ Docker is not installed."
    exit 1
fi

if ! command -v docker compose &> /dev/null
then
    echo "❌ Docker Compose is not installed."
    exit 1
fi

# ------------------------------------------------------------------
# Start Containers
# ------------------------------------------------------------------

echo "📦 Starting Docker containers..."

docker compose up -d --build

# ------------------------------------------------------------------
# Backend Setup
# ------------------------------------------------------------------

echo "⚙️ Installing backend dependencies..."

docker compose exec php composer install

echo "🧹 Clearing Symfony cache..."

docker compose exec php php bin/console cache:clear

echo "🗄️ Creating database..."

# docker compose exec php php bin/console doctrine:database:drop --force
docker compose exec php php bin/console doctrine:database:create --if-not-exists

echo "📚 Running migrations..."

docker compose exec php php bin/console doctrine:migrations:migrate --no-interaction

echo "📚 Running doctrine:fixtures:load ..."

docker compose exec php php bin/console doctrine:fixtures:load


# ------------------------------------------------------------------
# JWT Setup
# ------------------------------------------------------------------

echo "🔐 Generating JWT keys..."

docker compose exec php php bin/console lexik:jwt:generate-keypair --skip-if-exists

# ------------------------------------------------------------------
# Frontend Setup
# ------------------------------------------------------------------

echo "🎨 Installing frontend dependencies..."

# docker compose exec frontend npm install

# docker compose exec frontend npm run dev

# ------------------------------------------------------------------
# Permissions
# ------------------------------------------------------------------

echo "🔑 Setting permissions..."

docker compose exec php chmod -R 777 var

# ------------------------------------------------------------------
# Final
# ------------------------------------------------------------------

echo ""
echo "✅ Setup completed successfully!"
echo ""
echo "🌐 Frontend:"
echo "   http://localhost:5173"
echo ""
echo "🛠 Backend API:"
echo "   http://localhost:8000/api"
echo ""
echo "🛠 Mailpit:"
echo "   http://localhost:8025"
echo ""