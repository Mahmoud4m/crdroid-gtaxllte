#!/usr/bin/env bash
set -euo pipefail

cat <<'MSG'
crDroid gtaxllte source preflight
This script does not download sources, compile Android, or flash a device.
MSG

printf '\nCurrent target codename: %s\n' "${TARGET_DEVICE:-gtaxllte}"
printf 'Current target model: %s\n' "${TARGET_MODEL:-SM-T585}"
printf 'Target crDroid branch: %s\n' "${CRDROID_BRANCH:-UNSET}"

if [[ "${TARGET_DEVICE:-gtaxllte}" != "gtaxllte" ]]; then
  echo "ERROR: this project is specifically for gtaxllte / SM-T585." >&2
  exit 2
fi
if [[ "${TARGET_MODEL:-SM-T585}" != "SM-T585" ]]; then
  echo "ERROR: model mismatch. Do not mix T580 and T585 builds." >&2
  exit 2
fi
if [[ -z "${CRDROID_BRANCH:-}" ]]; then
  echo "BLOCKED: set CRDROID_BRANCH only after selecting and auditing a compatible crDroid base." >&2
  exit 3
fi

case "$CRDROID_BRANCH" in
  8.0)
    echo "Candidate only: crDroid 8.0 / Android 12-era source is closer to the available LineageOS 19.1 device baseline, but compatibility is not proven. This script does not authorize a ROM compile or release."
    ;;
  17.0)
    echo "WARNING: crDroid 17.0 is a much newer Android generation than the available LineageOS 19.1 device baseline. Do not use without a separate compatibility port." >&2
    if [[ "${ALLOW_UNVERIFIED_BASE:-0}" != "1" ]]; then exit 4; fi
    ;;
  *)
    echo "Branch selected: $CRDROID_BRANCH. This is metadata only; perform a manual source audit before compiling." 
    ;;
esac

echo "Preflight checks passed at the metadata level only; device compatibility and build success are not implied."
