#!/bin/bash

# 🚀 GitHub Upload Script for AI Agent Architecture Package
# This script will help you upload all materials to GitHub

echo "================================================"
echo "🚀 AI Agent Architecture - GitHub Upload Helper"
echo "================================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}This script will help you upload the package to GitHub.${NC}"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${YELLOW}⚠️  Git is not installed. Please install Git first:${NC}"
    echo "   - macOS: brew install git"
    echo "   - Ubuntu: sudo apt-get install git"
    echo "   - Windows: Download from https://git-scm.com/"
    exit 1
fi

echo -e "${GREEN}✅ Git is installed${NC}"
echo ""

# Ask for GitHub username and repo name
echo -e "${BLUE}Please provide the following information:${NC}"
echo ""

read -p "GitHub Username: " GITHUB_USERNAME
read -p "Repository Name (e.g., ai-agent-swarm-architecture): " REPO_NAME

echo ""
echo -e "${YELLOW}📝 Summary:${NC}"
echo "   GitHub URL will be: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo ""

read -p "Does this look correct? (y/n): " CONFIRM

if [ "$CONFIRM" != "y" ]; then
    echo "Aborted. Please run the script again."
    exit 0
fi

echo ""
echo -e "${BLUE}🔧 Setting up Git repository...${NC}"

# Initialize git if not already initialized
if [ ! -d .git ]; then
    git init
    echo -e "${GREEN}✅ Git repository initialized${NC}"
else
    echo -e "${GREEN}✅ Git repository already exists${NC}"
fi

# Create .gitignore if it doesn't exist
if [ ! -f .gitignore ]; then
    cat > .gitignore << 'EOF'
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
env/
venv/
ENV/

# IDEs
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Temporary files
*.tmp
*.bak

# Logs
*.log
EOF
    echo -e "${GREEN}✅ Created .gitignore${NC}"
fi

# Add all files
echo ""
echo -e "${BLUE}📦 Adding files to Git...${NC}"
git add .
echo -e "${GREEN}✅ Files added${NC}"

# Commit
echo ""
echo -e "${BLUE}💾 Creating commit...${NC}"
git commit -m "Initial commit: Complete AI Agent Architecture & Enablement Package

This package includes:
- Interactive animated demo of swarm communication
- Comprehensive blog post with code examples
- Architecture presentation deck (18 slides)
- AI Enablement strategy deck (20 slides)
- Executive summary one-pager
- Complete documentation and guides

Answers two key questions:
1. How to architect AI Agents/LLM from scratch
2. How to design enterprise-wide AI enablement program"

echo -e "${GREEN}✅ Commit created${NC}"

# Set up remote
echo ""
echo -e "${BLUE}🔗 Setting up GitHub remote...${NC}"
git branch -M main
git remote remove origin 2>/dev/null  # Remove if exists
git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
echo -e "${GREEN}✅ Remote configured${NC}"

echo ""
echo -e "${YELLOW}================================================${NC}"
echo -e "${YELLOW}⚠️  IMPORTANT: Next Steps${NC}"
echo -e "${YELLOW}================================================${NC}"
echo ""
echo -e "${BLUE}1. Create the repository on GitHub:${NC}"
echo "   - Go to: https://github.com/new"
echo "   - Repository name: $REPO_NAME"
echo "   - Description: AI Agent Architecture & Enterprise Enablement Strategy"
echo "   - Make it Public or Private (your choice)"
echo "   - DO NOT initialize with README, .gitignore, or license"
echo "   - Click 'Create repository'"
echo ""
echo -e "${BLUE}2. After creating the repo, run this command to push:${NC}"
echo -e "${GREEN}   git push -u origin main${NC}"
echo ""
echo -e "${BLUE}3. If prompted for authentication:${NC}"
echo "   - Username: $GITHUB_USERNAME"
echo "   - Password: Use a Personal Access Token (not your password)"
echo "   - Get token at: https://github.com/settings/tokens"
echo ""
echo -e "${BLUE}4. Share the link with :${NC}"
echo -e "${GREEN}   https://github.com/$GITHUB_USERNAME/$REPO_NAME${NC}"
echo ""
echo -e "${YELLOW}================================================${NC}"
echo ""

read -p "Have you created the GitHub repo and ready to push? (y/n): " READY

if [ "$READY" = "y" ]; then
    echo ""
    echo -e "${BLUE}🚀 Pushing to GitHub...${NC}"
    git push -u origin main
    
    if [ $? -eq 0 ]; then
        echo ""
        echo -e "${GREEN}================================================${NC}"
        echo -e "${GREEN}🎉 SUCCESS! Package uploaded to GitHub!${NC}"
        echo -e "${GREEN}================================================${NC}"
        echo ""
        echo -e "${BLUE}📎 Share this link with :${NC}"
        echo -e "${GREEN}https://github.com/$GITHUB_USERNAME/$REPO_NAME${NC}"
        echo ""
        echo -e "${BLUE}📧 Example message to send:${NC}"
        echo ""
        echo "Hi ,"
        echo ""
        echo "I've prepared a comprehensive package answering your questions about"
        echo "AI agent architecture and enterprise AI enablement."
        echo ""
        echo "GitHub Repository: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
        echo ""
        echo "The package includes:"
        echo "• Interactive demo (open swarm_communication_demo.html in browser)"
        echo "• 2 presentation decks (18 + 20 slides)"
        echo "• Comprehensive technical guide"
        echo "• Executive summary"
        echo ""
        echo "Start with the README.md for the full guide!"
        echo ""
        echo "Looking forward to discussing!"
        echo ""
    else
        echo ""
        echo -e "${YELLOW}⚠️  Push failed. Common issues:${NC}"
        echo "1. Repository doesn't exist on GitHub yet"
        echo "2. Authentication failed - need Personal Access Token"
        echo "3. Branch protection rules"
        echo ""
        echo "Try running manually: git push -u origin main"
    fi
else
    echo ""
    echo -e "${YELLOW}No problem! When ready, run:${NC}"
    echo -e "${GREEN}git push -u origin main${NC}"
fi

echo ""
echo -e "${BLUE}================================================${NC}"
echo -e "${BLUE}📚 Quick Command Reference:${NC}"
echo -e "${BLUE}================================================${NC}"
echo ""
echo "View status:      git status"
echo "Add more files:   git add ."
echo "Commit changes:   git commit -m 'Your message'"
echo "Push to GitHub:   git push"
echo "View remote:      git remote -v"
echo ""
