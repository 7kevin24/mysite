# PowerShell script to commit, push, and deploy using MkDocs

# Get commit message from argument or use default
$commit_msg = if ($args.Length -gt 0) { $args[0] } else { "Update blog" }

# Add all changes
git add .

# Commit with provided message
git commit -m $commit_msg

# Push to main branch
git push origin main

# Deploy to GitHub Pages
mkdocs gh-deploy
