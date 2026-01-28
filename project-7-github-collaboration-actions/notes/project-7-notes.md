# Project 7 Notes: GitHub Collaboration & Actions

## What this project demonstrates
- Working with feature branches
- Opening Pull Requests
- Using Issues to track work
- Running CI with GitHub Actions

## CI Workflow
- CI is defined in `.github/workflows/ci.yml`
- Runs on push to main and on pull requests
- Uses Ubuntu runner
- Performs basic repository checks

## Key Learnings
- CI workflows live in `.github/workflows`
- Pull Requests trigger CI automatically
- Actions help enforce consistency before merge