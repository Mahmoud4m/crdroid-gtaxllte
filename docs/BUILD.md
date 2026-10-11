# Build plan

## Candidate source baseline

The first candidate is crDroid branch `8.0` (Android 12/12L generation) with the T585 device tree on `lineage-19.1` used as a reference. The pairing is not yet proven compatible; use it as a source-port experiment, not as a promise of a working ROM. Do not use crDroid `17.0` with this older device configuration without a separate compatibility port.

Before source sync:

1. Read the crDroid 8.0 manifest and identify the required toolchain and project revisions.
2. Review `AndroidProducts.mk`, product makefiles, `BoardConfig.mk`, `device.mk`, dependencies and kernel configuration in the selected T585 source.
3. Compare expected platform interfaces, vendor API level, kernel configuration, sepolicy, HALs and package names.
4. Produce a reviewed manifest with pinned project revisions and a device-specific `crdroid.dependencies` file, then verify that source licenses permit redistribution.
5. Make sure the actual lunch product exists. Do not assume `crdroid_gtaxllte` or `lineage_gtaxllte` works in crDroid without checking the product makefiles.

## Build-host requirements

Use a Linux x86-64 host with reliable internet. For current Android sources, plan for hundreds of GB of SSD space; the Android Open Source Project guide specifies 400 GB free disk and at least 64 GB RAM for a full AOSP build. Device-specific builds vary, but a standard GitHub-hosted runner (14 GB SSD, 16 GB RAM for public repos) is not a realistic full clean-build host.

Free-first plan: GitHub Actions on a public repository runs static checks. Run the full compile only on a trusted self-hosted Linux machine that is available at no additional cost. GitHub does not bill Actions minutes for self-hosted runners, but the hardware, internet and electricity are not automatically free. Do not attach self-hosted runners to untrusted pull-request workflows.

## Build sequence once the source base is approved

1. Initialize `repo` against `https://github.com/crdroidandroid/android.git -b 8.0`.
2. Add a reviewed `.repo/local_manifests/roomservice.xml`; don't blindly copy optional forks from the legacy LineageOS manifest.
3. Sync sources, recording all repository SHAs.
4. Run `. build/envsetup.sh`, inspect available lunch targets, then choose the exact defined product.
5. Build `otapackage` and preserve complete logs.
6. Validate device assertions, archive structure, output filename and SHA-256.
7. Test on the exact SM-T585 device before any stable release.

No script in this starter project flashes the tablet or claims to produce an installable ROM.
