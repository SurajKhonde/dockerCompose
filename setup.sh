#!/bin/bash

# ----------------------------------------
# 🐳 Setup Script for Local Dev Databases
# ----------------------------------------

REPO_URL="https://github.com/SurajKhonde/dockerCompose.git"
REPO_NAME="dockerCompose"

# Check if git is installed
if ! command -v git &> /dev/null; then
  echo "❌ Git is not installed. Please install Git first."
  exit 1
fi

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
  echo "❌ Docker is not installed. Please install Docker Desktop first."
  exit 1
fi

# Clone the repo only if it doesn't already exist
if [ ! -d "$REPO_NAME" ]; then
  echo "🔄 Cloning repository..."
  git clone "$REPO_URL" || {
    echo "❌ Failed to clone repository."
    exit 1
  }
else
  echo "📂 Repo already exists. Using existing folder: $REPO_NAME"
fi

cd "$REPO_NAME" || {
  echo "❌ Failed to enter $REPO_NAME directory."
  exit 1
}

# ------------------------------
# Show Menu for Services
# ------------------------------
echo ""
echo "🌐 Choose a service to run:"
echo "1) MongoDB"
echo "2) MySQL with phpMyAdmin"
echo "3) Redis"
echo "4) All services"
read -rp "👉 Enter your choice [1-4]: " SERVICE_CHOICE

# ------------------------------
# Ask if foreground or detached
# ------------------------------
read -rp "🔁 Run in background (detached mode)? (y/n): " RUN_BG
if [[ "$RUN_BG" =~ ^[Yy]$ ]]; then
  MODE="-d"
else
  MODE=""
fi

# Function to run a docker-compose in a subdirectory
run_compose() {
  local dir=$1
  if [ -d "$dir" ]; then
    echo ""
    echo "🚀 Starting service in '$dir'..."
    cd "$dir" || return
    docker compose up $MODE
    cd ..
  else
    echo "⚠️ Directory '$dir' not found. Skipping..."
  fi
}

# Run services based on choice
case $SERVICE_CHOICE in
  1)
    run_compose "Mongodb"
    ;;
  2)
    run_compose "Mysql"
    run_compose "phpMyAdmin"
    ;;
  3)
    run_compose "Redis"
    ;;
  4)
    run_compose "Mongodb"
    run_compose "Mysql"
    run_compose "Redis"
    run_compose "phpMyAdmin"
    ;;
  *)
    echo "❌ Invalid choice. Exiting."
    exit 1
    ;;
esac

# ------------------------------
# Final Info
# ------------------------------
echo ""
echo "✅ Done! You can check running containers with:"
echo "   docker ps"
echo ""
echo "🔍 Access Info:"
echo "- MongoDB:      Use MongoDB Compass -> mongodb://localhost:27017/yourDBname"
echo "- MySQL:        Host: localhost, Port: 3306, User: devuser, Pass: devpass"
echo "- phpMyAdmin:   http://localhost:8081"
echo "- Redis:        Host: localhost, Port: 6379"
echo ""
