Source audit — SM-T585 / gtaxllte

Target

- Device: Samsung Galaxy Tab A 10.1 (2016) LTE
- Model: SM-T585
- Codename: "gtaxllte"
- Intended base: crDroid 12.1 / Android 12.1
- Reference device platform: LineageOS 19.1

The target is not a confirmed working build. Do not set "BASE_AUDIT_APPROVED=1" until all required repositories and revisions have been verified.

Candidate crDroid device manifest

Component| Source| Status
crDroid platform manifest| https://github.com/crdroidandroid/android/tree/12.1| Android 12.1 manifest candidate
Device family manifest| https://github.com/SeifHossam20/gtaxl-manifests/tree/crdroid-12.1| Historical device manifest candidate; requires dependency audit
Device tree| https://github.com/SeifHossam20/android_device_samsung_gtaxllte/tree/lineage-19.1| Public; device product and kernel configuration references found
Common device tree| https://github.com/SeifHossam20/android_device_samsung_gtaxl-common/tree/lineage-19.1| Public; requires full dependency review
LTE vendor tree| https://github.com/SeifHossam20/android_vendor_samsung_gtaxllte/tree/lineage-19.1| Public; proprietary files and licensing need review
Kernel source| https://github.com/SeifHossam20/android_kernel_samsung_exynos7870/tree/lineage-19.1| Public; Linux 3.18.140
Required kernel config| https://github.com/SeifHossam20/android_kernel_samsung_exynos7870/blob/lineage-19.1/arch/arm64/configs/lineage-gtaxllte_defconfig| File found

Blocking dependency issue

The candidate "gtaxl.xml" manifest references repositories hosted under the "K9100ii" account, including SLSI hardware and Android framework/system forks.

These repositories could not be located through the current GitHub checks. This does not prove that every repository is permanently deleted, but the manifest must not be used unchanged until every project URL and required branch is verified.

Required checks:

1. Identify a reachable repository and compatible revision for every required manifest project.
2. Confirm the required SLSI hardware projects and their Android 12.1 compatibility.
3. Audit the "frameworks/base", "system/bpf", "system/netd", and other fork requirements. Do not remove or replace upstream projects without understanding the impact.
4. Confirm that each project uses the correct repository path and branch.
5. Record the resolved commit SHA for every approved source.

Device identity and product

The target must remain "gtaxllte" / "SM-T585".

Do not substitute "gtaxlwifi" / "SM-T580".

The candidate device tree declares "lineage_gtaxllte-userdebug" as a lunch choice and references "lineage-gtaxllte_defconfig". These declarations are evidence for the reference tree only; the final product configuration must be checked after integrating the chosen crDroid sources.

Build gate

Status: BLOCKED — source manifest dependencies are not fully verified.

Do not start a full source sync, compile a release, or flash the tablet until the required projects are reachable, their branches are compatible, and the final manifest is documented.

This repository remains a development scaffold. No successful crDroid build or installable package has been confirmed.