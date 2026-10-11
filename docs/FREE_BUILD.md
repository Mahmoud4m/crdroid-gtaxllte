# Free-first build plan (checked 2026-10-12)

## What GitHub gives us for free

For **public repositories**, standard GitHub-hosted Actions runners are documented as free and unlimited. The standard `ubuntu-latest` public runner currently has 4 CPUs, 16 GB RAM, and 14 GB SSD. That is enough for linting, validating manifests/scripts, and recording source metadata, but **not enough disk space for a complete modern Android checkout plus build output**.

References:
- GitHub-hosted runner specifications: https://docs.github.com/en/actions/reference/runners/github-hosted-runners
- Actions billing: https://docs.github.com/en/billing/concepts/product-billing/github-actions
- Actions limits: https://docs.github.com/en/actions/reference/limits
- Android Open Source Project build workstation requirements: https://source.android.com/docs/setup/start

The official AOSP workstation guide currently advises 400 GB free disk space and at least 64 GB RAM for a full AOSP build. Device-specific ROM builds can vary, but planning around 300–400 GB SSD and 32–64 GB RAM is safer than pretending a 14 GB runner can do it.

## Honest no-cost plan

1. Keep this project repository public if comfortable publishing the device-port work. Do **not** commit EFS backups, private keys, tokens, logs with device identifiers, or proprietary/vendor blobs unless their redistribution rights are clear.
2. Use standard GitHub Actions only for inexpensive checks: shell syntax, target-device guard, source-link/branch audits, XML validation, and workflow validation.
3. For the actual ROM compile, use a trusted **self-hosted GitHub Actions runner** on an x86-64 Linux computer with sufficient RAM and SSD, donated/community build host, or a machine that is already available at no additional charge. GitHub does not charge Actions minutes for self-hosted runners, but the machine, internet, electricity, and maintenance still have costs.
4. Do not attach a self-hosted runner to a public repository that accepts untrusted pull requests. The build workflow must run only on manual dispatch from a trusted branch, and the runner should not contain personal secrets or irreplaceable files.
5. If no suitable machine is available, continue source auditing on GitHub for free and defer the full compile; do not quietly enable a paid cloud VM or rely on an expiring free trial.

## Why not build the whole ROM on `ubuntu-latest`?

Its 14 GB SSD is far below the normal checkout + intermediates + output footprint. Disk-cleanup tricks do not reliably create the hundreds of GB needed, and adding swap does not solve the disk shortage or make a constrained build pleasant. Public Actions can remain free and useful without compiling a whole ROM there.

## Chosen Android baseline (candidate, not approved for release)

The best first *compatibility experiment* is crDroid's `8.0` source branch (the Android 12/12L generation) alongside the available `gtaxllte` device tree on `lineage-19.1`. This is a much more coherent starting point than trying to combine an Android 12L device tree directly with the current crDroid `17.0` source generation. This pairing is still **unproven**: product files, dependencies, kernel/toolchain requirements, and any framework patches must be reconciled and a clean build must succeed before calling the base buildable. A successful compile still does not prove modem, GPS, camera, suspend, or battery behavior.

Source references:
- crDroid source branches: https://github.com/crdroidandroid/android/branches/all
- LTE device tree: https://github.com/miikaoskari/android_device_samsung_gtaxllte/tree/lineage-19.1
- LTE vendor tree: https://github.com/miikaoskari/android_vendor_samsung_gtaxllte/tree/lineage-19.1
- family manifest: https://github.com/gargomoma/gtaxl-manifests/tree/lineage-19.1

## Current state

- Public source references checked; no ROM has been built by this project yet.
- GitHub repository creation/pushing must be completed by the project owner in GitHub's web UI or local Git, because the connected GitHub actions available in this session do not expose a create-new-repository operation.
- The included `build-rom.yml` is intentionally a readiness check. It does **not** sync Android, invoke the compiler, produce a ZIP, or flash the tablet.
