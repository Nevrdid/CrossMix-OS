#!/bin/sh

/mnt/SDCARD/System/usr/trimui/scripts/infoscreen.sh -m "Applying \"$(basename "$0" .sh)\" by default..."

TAILSCALED="/mnt/SDCARD/System/bin/tailscaled"
TAILSCALE="/mnt/SDCARD/System/bin/tailscaled"
$TAILSCALE down
pkill -9 "$TAILSCALED"
pkill -9 "$TAILSCALE"


# we modify the DB entries to reflect the current state
/mnt/SDCARD/System/usr/trimui/scripts/states_update.sh "Tailscale" "disabled"
sync

sleep 0.1
