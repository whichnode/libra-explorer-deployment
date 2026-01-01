#!/bin/bash

# Script to apply all deployment YAML files in k8s-manifest-files directory

set -e  # Exit on error

MANIFEST_DIR="k8s-manifest-files"
KUBECTL_NAMESPACE="${KUBECTL_NAMESPACE:-olfyi-0001}"

# Check if the manifest directory exists
if [ ! -d "$MANIFEST_DIR" ]; then
    echo "Error: Directory '$MANIFEST_DIR' not found"
    exit 1
fi

# Find and apply all deployment*.yaml files
echo "Applying deployment manifests from $MANIFEST_DIR to namespace '$KUBECTL_NAMESPACE'..."

for file in "$MANIFEST_DIR"/deployment*.yaml; do
    if [ -f "$file" ]; then
        echo "Applying $file..."
        kubectl apply -f "$file" --namespace "$KUBECTL_NAMESPACE"
    fi
done

echo "All deployment manifests applied successfully!"
