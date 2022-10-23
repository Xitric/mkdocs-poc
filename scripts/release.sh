#!/bin/bash
set -euo pipefail

DOCS_VERSION=$1
DEFAULT_ALIAS="latest"

GITOPS_REMOTE="https://bizzkit-platform@dev.azure.com/bizzkit-platform/Bizzkit/_git/gitops-partnerportal"
GITOPS_REMOTE_NAME="gitops"
GITOPS_BRANCH="main"
GITOPS_DOCS_DIRECTORY="docs"

# Add origin to integrate with mike
git remote add $GITOPS_REMOTE_NAME $GITOPS_REMOTE

# Generate version patches
mike deploy --branch $GITOPS_BRANCH --remote $GITOPS_REMOTE_NAME --prefix $GITOPS_DOCS_DIRECTORY --update-aliases $DOCS_VERSION $DEFAULT_ALIAS
mike set-default --branch $GITOPS_BRANCH --remote $GITOPS_REMOTE_NAME --prefix $GITOPS_DOCS_DIRECTORY --push $DEFAULT_ALIAS

# Clean up after mike
rm -r site
git branch -D $GITOPS_BRANCH
git remote remove $GITOPS_REMOTE_NAME
