# crDroid for Samsung Galaxy Tab A 10.1 (2016) LTE (SM-T585 / gtaxllte)

> **Development scaffold only. This is not a ROM, not a tested build, and not safe to flash.**

The purpose of this project is to assemble a reproducible, free-first source audit and build path for an unofficial crDroid port targeting the LTE model `SM-T585` (`gtaxllte`).

## Current direction

- **Target:** Samsung SM-T585 / `gtaxllte` only. The SM-T580 / `gtaxlwifi` is not interchangeable.
- **First source candidate:** crDroid branch `8.0` (Android 12/12L era), using the existing LineageOS 19.1 device configuration as a compatibility reference. This pairing is a hypothesis to test, not an approved build.
- **Do not start with crDroid 17.0:** it is a much newer Android generation than the currently identified device tree. Porting that far forward would require substantial work and cannot be treated as a simple manifest swap.
- **Build cost:** GitHub Actions will do free lightweight checks only. Standard public runners have 14 GB SSD and cannot hold a complete Android checkout/build. Actual compilation needs a trusted self-hosted Linux machine with hundreds of GB available.

## Public source references reviewed

- [T585 device tree (`lineage-19.1`)](https://github.com/miikaoskari/android_device_samsung_gtaxllte/tree/lineage-19.1)
- [T585 vendor tree (`lineage-19.1`)](https://github.com/miikaoskari/android_vendor_samsung_gtaxllte/tree/lineage-19.1)
- [gtaxl-family manifest (`lineage-19.1`)](https://github.com/gargomoma/gtaxl-manifests/tree/lineage-19.1)
- [crDroid source branches](https://github.com/crdroidandroid/android/branches/all)
- [SM-T585 custom ROM index](https://github.com/ZORO2045/SM-T585-Custom-ROMs)

The device tree includes explicit LTE/RIL, GPS and vibration configuration. It remains necessary to reconcile all branches and dependencies against the crDroid 8.0 source before compiling. The older family manifest contains optional forks and patches; do not copy them blindly.

## Free-first milestones

1. **Audit:** check source URLs, branch history, licenses and exact product name.
2. **Resolve dependencies:** derive an appropriate `crdroid.dependencies` and local manifest from real source files; pin commits after review.
3. **Build host:** use a suitable self-hosted Linux x86-64 system available at no additional cost. The laptop with 2 GB RAM is not a realistic Android build host.
4. **Compile:** build only after source compatibility is reviewed; preserve complete logs and source SHAs.
5. **Validate package:** inspect ZIP assertions and contents and compute SHA-256.
6. **Device test:** evaluate boot, display/touch, Wi-Fi, Bluetooth, SIM/LTE/calls, GPS, camera, audio, vibration, charging, suspend/resume and idle drain.
7. **Release:** publish only with known issues, source revisions, checksums and device-test results.

## Important safety rules

- Never flash a `gtaxlwifi` / SM-T580 build onto `gtaxllte` / SM-T585.
- Never commit EFS/modem backups, signing keys, access tokens, passwords, or private identifiers.
- Do not publicly redistribute proprietary Samsung blobs without reviewing their license and redistribution rights.
- Never run flashing commands from CI.
- A successful build does not prove LTE, GPS, camera, suspend or battery behavior works.

## Workflows

- `Source preflight` performs inexpensive checks suitable for GitHub-hosted public runners.
- `Build host readiness` validates the target and candidate branch but **does not sync or compile Android**. It is intentionally not a ROM builder until a proper host and source manifest have been approved.

See [`docs/FREE_BUILD.md`](docs/FREE_BUILD.md), [`docs/SOURCES.md`](docs/SOURCES.md), [`docs/BUILD.md`](docs/BUILD.md), and [`docs/TESTING.md`](docs/TESTING.md).
