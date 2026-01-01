#!/bin/bash
#
# restart-explorer.sh
#
# Restarts the explorer-worker and explorer-api deployments by updating
# a FORCE_RESTART environment variable, which triggers a rolling restart.
#
# Usage:
#   ./restart-explorer.sh
#
# Cron setup (run daily at 3:00 AM as root):
#   sudo crontab -e
#   Add: 0 3 * * * /path/to/restart-explorer.sh >> /var/log/explorer-restart.log 2>&1
#

set -euo pipefail

NAMESPACE="olfyi-0001"
DEPLOYMENTS=("explorer-worker" "explorer-api")
TIMESTAMP=$(date)

echo "=========================================="
echo "Explorer restart initiated at: $TIMESTAMP"
echo "=========================================="

for deployment in "${DEPLOYMENTS[@]}"; do
    echo "Restarting deployment: $deployment"
    kubectl -n "$NAMESPACE" set env deployment "$deployment" FORCE_RESTART="$TIMESTAMP"
    echo "  -> $deployment restart triggered"
done

echo "All deployments restarted successfully."
