Build plan

Source selection — blocked pending verification

Do not assume a crDroid branch number identifies an Android version. The previously suggested "8.0" baseline has not been verified as Android 12/12L and must not be used for a source sync.

The initial goal is an Android 12L-compatible base for Samsung Galaxy Tab A 10.1 (2016) LTE ("SM-T585", "gtaxllte"), using the available LineageOS 19.1 device sources as a reference. This is a target, not a claim that a compatible crDroid base is already confirmed.

Before selecting a branch:

1. Inspect the exact crDroid manifest and confirm its Android platform version, project revisions, and build requirements.
2. Review the T585 device tree, shared "gtaxl-common" tree, vendor tree, kernel source and configuration, and all declared dependencies.
3. Compare platform interfaces, vendor compatibility, kernel requirements, SELinux policy, HALs, and product definitions.
4. Confirm the exact product and lunch target from the checked-out source. Do not assume that "crdroid_gtaxllte" or "lineage_gtaxllte" is valid without verification.
5. Pin source revisions and document licensing and redistribution restrictions before publishing any build.

The device target must remain "gtaxllte" / "SM-T585". Do not substitute "gtaxlwifi" / "SM-T580", which is the Wi-Fi-only model.

Do not sync the full source tree until the base and required repositories have been reviewed.

Build-host requirements

Use a reliable Linux x86-64 build host. Full Android builds can require hundreds of gigabytes of SSD space and substantial RAM. The exact requirements depend on the Android base and build configuration.

The current laptop is not the planned full-build host. Use GitHub Actions for lightweight static checks only unless a suitable build runner is available.

A self-hosted runner is not automatically free: hardware, connectivity, storage, and electricity still have costs. Never expose a self-hosted runner to untrusted pull-request workflows.

Build sequence

1. Approve and record the Android base and manifest revisions.
2. Review and pin the device, common, vendor, kernel, and other required source repositories.
3. Create a reviewed ".repo/local_manifests/roomservice.xml" and device-specific dependency declarations only after verifying the repository paths and branches.
4. Sync sources and record the resolved Git SHAs.
5. Run ". build/envsetup.sh" and inspect the actual available lunch targets.
6. Build the verified product and preserve complete build logs.
7. Validate the generated package, device assertions, archive structure, and SHA-256.
8. Test on the exact SM-T585, including LTE, Wi-Fi, GPS, Bluetooth, camera, audio, suspend/resume, and reboot, before considering a stable release.

Current status

This repository is a development scaffold. No compatible crDroid base, successful build, or installable ROM has been confirmed. No script in this project flashes the tablet. Do not flash an experimental package or overwrite device backups as part of source preparation.