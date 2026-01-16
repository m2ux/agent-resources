#!/usr/bin/env bash
# Update the agent/resources submodule to a specific version tag
#
# Usage: ./agent/resources/scripts/update-resources.sh v0.2.0
#   or:  cd agent/resources && ./scripts/update-resources.sh v0.2.0

set -e

VERSION="${1:-}"

# Script is at .engineering/agent/resources/scripts/
# We need to find .engineering/ (3 levels up)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
RESOURCES_DIR="$(dirname "$SCRIPT_DIR")"
ENGINEERING_ROOT="$(dirname "$(dirname "$RESOURCES_DIR")")"

if [ -z "$VERSION" ]; then
    echo "Usage: $0 <version-tag>"
    echo "Example: $0 v0.2.0"
    echo ""
    echo "Available tags:"
    cd "$RESOURCES_DIR"
    git fetch --tags --quiet
    git tag -l 'v*' | sort -V
    exit 1
fi

cd "$RESOURCES_DIR"

echo "Fetching tags..."
git fetch --tags --quiet

if ! git rev-parse "$VERSION" >/dev/null 2>&1; then
    echo "Error: Tag '$VERSION' not found"
    echo ""
    echo "Available tags:"
    git tag -l 'v*' | sort -V
    exit 1
fi

echo "Checking out $VERSION..."
git checkout "$VERSION" --quiet

cd "$ENGINEERING_ROOT"
git add agent/resources

echo ""
echo "Updated agent/resources to $VERSION"
echo "Run the following to commit:"
echo "  git commit -m \"chore: update resources to $VERSION\""
