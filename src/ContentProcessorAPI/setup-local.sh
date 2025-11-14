#!/bin/bash

# Script to set up local development environment for Content Processor API

echo "🔧 Setting up local development environment..."
echo ""

# Check if we're in the right directory
if [ ! -f "app/main.py" ]; then
    echo "❌ Error: This script must be run from the src/ContentProcessorAPI directory"
    echo "   Please run: cd src/ContentProcessorAPI"
    exit 1
fi

# Check if azd is logged in
echo "📋 Checking Azure Developer CLI authentication..."
if ! azd auth login --check-status &> /dev/null; then
    echo "⚠️  You're not logged in to Azure. Running login..."
    azd auth login
fi

# Navigate to the repo root to run azd commands
cd ../..

# Get environment variables from azd
echo "📦 Fetching environment variables from Azure deployment..."
azd env get-values > src/ContentProcessorAPI/.env

# Go back to API directory
cd src/ContentProcessorAPI

echo ""
echo "✅ Environment variables saved to .env file!"
echo ""
echo "📝 Next steps:"
echo "   1. Activate your virtual environment: source venv/bin/activate"
echo "   2. Install dependencies (if not done): pip install -r requirements.txt"
echo "   3. Start the API server: uvicorn app.main:app --reload --host 0.0.0.0 --port 8000"
echo ""
echo "🌐 API will be available at: http://localhost:8000"
echo "📚 API docs will be at: http://localhost:8000/docs"
