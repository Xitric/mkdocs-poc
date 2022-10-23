#!/bin/bash
set -euo pipefail

DOCS_VERSION=$1
GITOPS_ORIGIN="https://bizzkit-platform@dev.azure.com/bizzkit-platform/Bizzkit/_git/gitops-partnerportal"

# Add origin to integrate with mike
git remote add gitops $GITOPS_ORIGIN

# Generate version patches
mike deploy --branch main --remote gitops --prefix docs --update-aliases $DOCS_VERSION latest
mike set-default --branch main --remote gitops --prefix docs --push latest

# Clean up after mike
git remote remove gitops
