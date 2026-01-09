#!/bin/bash

# patch-ironsource.sh
# Patches IronSource.xcframework to add missing headers to umbrella header

set -e

XCFRAMEWORK_PATH="${1:-}"

if [ -z "$XCFRAMEWORK_PATH" ]; then
    echo "Usage: $0 <path-to-IronSource.xcframework>"
    exit 1
fi

if [ ! -d "$XCFRAMEWORK_PATH" ]; then
    echo "Error: $XCFRAMEWORK_PATH does not exist"
    exit 1
fi

# Headers missing from umbrella header
MISSING_HEADERS=(
    "ISBiddingDataProtocol.h"
    "LevelPlayBaseAdapter.h"
    "LevelPlayBaseNativeAdAdapter.h"
    "LevelPlayBaseRewardedAdapter.h"
    "LevelPlayBaseInterstitialAdapter.h"
    "LevelPlayBaseBannerAdapter.h"
    "ISConcurrentMutableArray.h"
)

# Find all IronSource.h umbrella headers in the xcframework
find "$XCFRAMEWORK_PATH" -name "IronSource.h" -path "*/Headers/*" | while read -r HEADER_FILE; do
    echo "Patching: $HEADER_FILE"

    # Check if already patched
    if grep -q "ISBiddingDataProtocol.h" "$HEADER_FILE" 2>/dev/null; then
        echo "  Already patched, skipping"
        continue
    fi

    # Build the import block
    IMPORT_BLOCK=""
    HEADER_DIR=$(dirname "$HEADER_FILE")

    for header in "${MISSING_HEADERS[@]}"; do
        # Only add import if header file exists
        if [ -f "$HEADER_DIR/$header" ]; then
            IMPORT_BLOCK="${IMPORT_BLOCK}#import \"$header\"\n"
            echo "  Adding: $header"
        else
            echo "  Skipping (not found): $header"
        fi
    done

    if [ -n "$IMPORT_BLOCK" ]; then
        # Insert imports before the final #endif
        # Using perl for cross-platform compatibility
        perl -i -pe "s/^#endif\s*$/$(echo -e "$IMPORT_BLOCK")\n\n#endif/" "$HEADER_FILE"
        echo "  Done"
    fi
done

echo ""
echo "Patching complete!"
