
#!/bin/bash

# macOS DNS Cache Flush
# Author: Raya Obaidi
# Purpose: Clear local DNS cache

set -e

echo "Starting DNS cache flush..."

if [[ "$(uname)" != "Darwin" ]]; then
    echo "Error: macOS is required."
    exit 1
fi

# Flush DNS cache
sudo dscacheutil -flushcache

# Refresh DNS responder
sudo killall -HUP mDNSResponder

echo "DNS cache flush completed."
