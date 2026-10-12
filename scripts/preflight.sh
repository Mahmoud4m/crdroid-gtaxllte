#!/usr/bin/env bash
set -euo pipefail

cat <<'MSG'
crDroid gtaxllte source preflight
This script checks target identity and source-audit approval only.
It does not sync sources, compile Android, or flash a device.
Passing this script does not prove device compatibility.
MSG

TARGET_DEVICE="${TARGET_DEVICE:-gtaxllte}"
TARGET_MODEL="${TARGET_MODEL:-SM-T585}"
CRDROID_BRANCH="${CRDROID_BRANCH:-}"
BASE_AUDIT_APPROVED="${BASE_AUDIT_APPROVED:-0}"

printf '\nTarget codename: %s\n' "$TARGET_DEVICE"
printf 'Target model: %s\n' "$TARGET_MODEL"
printf 'crDroid branch: %s\n' "${CRDROID_BRANCH:-UNSET}"
printf 'Source audit approved: %s\n' "$BASE_AUDIT_APPROVED"

if [[ "$TARGET_DEVICE" != "gtaxllte" ]]; then
echo "ERROR: expected gtaxllte (Samsung SM-T585 LTE)." >&2
echo "Do not use gtaxlwifi, which targets the Wi-Fi-only SM-T580." >&2
exit 2
fi

if [[ "$TARGET_MODEL" != "SM-T585" ]]; then
echo "ERROR: expected model SM-T585." >&2
exit 2
fi

if [[ -z "$CRDROID_BRANCH" ]]; then
echo "BLOCKED: set CRDROID_BRANCH after inspecting the actual source manifest." >&2
exit 3
fi

if [[ "$BASE_AUDIT_APPROVED" != "1" ]]; then
echo "BLOCKED: source base has not been explicitly approved after audit." >&2
echo "Verify the Android version, manifest, device/common/vendor trees," >&2
echo "kernel configuration, dependencies, and product lunch target first." >&2
exit 4
fi

echo
echo "Identity and approval flags passed."
echo "This is not a build-readiness or compatibility test."
echo "Do not sync, compile, or flash until the source audit is documented."