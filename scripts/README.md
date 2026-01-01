# Explorer Restart Script

## Overview

`restart-explorer.sh` restarts the `explorer-worker` and `explorer-api` deployments in the `olfyi-0001` namespace. This is a workaround for system reliability issues until the root cause is diagnosed.

## Cron Setup

To run the script daily as root:

```bash
sudo crontab -e
```

Add this line to run at 3:00 AM:

```
0 3 * * * <path-to-this-project>/libra-explorer-deployment/scripts/restart-explorer.sh >> /var/log/explorer-restart.log 2>&1
```

Adjust the time as needed (format: `minute hour * * *`).

## Manual Execution

```bash
./restart-explorer.sh
```

## Log File

Output is appended to `/var/log/explorer-restart.log` when run via cron.
