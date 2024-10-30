#!/bin/bash

# Get commit message from argument or use default
commit_msg=${1:-"Update blog"}

# Add all changes
git add .

# Commit with provided message
git commit -m "$commit_msg"

# Push to main branch
git push origin main

# Deploy to GitHub Pages
mkdocs gh-deploy