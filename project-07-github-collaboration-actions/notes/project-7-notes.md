# Project 7 Notes: GitHub Collaboration & Actions

## What this project demonstrates
- Working with feature branches
- Opening Pull Requests
- Using Issues to track work
- Running CI with GitHub Actions

### GitHub Secrets (CI)

A repository level GitHub Actions secret was added and referenced in the CI workflow to demonstrate secure handling of sensitive values.  
The workflow confirms the secret is available at runtime without exposing its value.

## CI Workflow
- CI is defined in `.github/workflows/ci.yml`
- Runs on push to main and on pull requests
- Uses Ubuntu runner
- Performs basic repository checks

## Key Learnings
- CI workflows live in `.github/workflows`
- Pull Requests trigger CI automatically
- Actions help enforce consistency before merge