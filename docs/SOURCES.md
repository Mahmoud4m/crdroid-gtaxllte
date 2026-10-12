Source audit — SM-T585 / gtaxllte

Audit date: 2026-10-12

Target

- Device: Samsung Galaxy Tab A 10.1 (2016) LTE
- Model: "SM-T585"
- Codename: "gtaxllte"
- Intended platform: crDroid 12.1 / Android 12.1
- Reference device platform: LineageOS 19.1 / Android 12L

This repository is a development scaffold, not a confirmed ROM build. A branch name or reachable repository alone does not prove compatibility. Keep "BASE_AUDIT_APPROVED=0" until every required project, revision, patch set, and final product target has been reviewed.

Candidate platform and device sources

Component| Candidate source| Current evidence / status
crDroid platform| "crDroid Android, branch 12.1" (https://github.com/crdroidandroid/android/tree/12.1)| Android 12.1 manifest candidate; exact resolved manifest revisions still need recording
Device-family manifest| "SeifHossam20/gtaxl-manifests, branch crdroid-12.1" (https://github.com/SeifHossam20/gtaxl-manifests/tree/crdroid-12.1)| Historical candidate; do not sync unchanged before dependency review
LTE device tree| "android_device_samsung_gtaxllte, lineage-19.1" (https://github.com/SeifHossam20/android_device_samsung_gtaxllte/tree/lineage-19.1)| Public; reference product and kernel-config declarations found
Common device tree| "android_device_samsung_gtaxl-common, lineage-19.1" (https://github.com/SeifHossam20/android_device_samsung_gtaxl-common/tree/lineage-19.1)| Public candidate; dependencies and compatibility need review
LTE vendor tree| "android_vendor_samsung_gtaxllte, lineage-19.1" (https://github.com/SeifHossam20/android_vendor_samsung_gtaxllte/tree/lineage-19.1)| Public candidate; proprietary blobs, provenance, and redistribution terms need review
Kernel source| "android_kernel_samsung_exynos7870, lineage-19.1" (https://github.com/SeifHossam20/android_kernel_samsung_exynos7870/tree/lineage-19.1)| Public candidate; Linux 3.18.140
Kernel config| "lineage-gtaxllte_defconfig" (https://github.com/SeifHossam20/android_kernel_samsung_exynos7870/blob/lineage-19.1/arch/arm64/configs/lineage-gtaxllte_defconfig)| File found; options must be checked against required Android 12L interfaces and drivers

The reference device tree declares "lineage_gtaxllte-userdebug" and references "lineage-gtaxllte_defconfig". These are reference-tree facts only. After choosing and integrating the crDroid platform, inspect the actual product makefiles and available lunch targets; do not assume the final target name.

Manifest dependency audit

The candidate "gtaxl.xml" replaces several upstream platform projects with forks, including "frameworks/base", "frameworks/native", "system/bpf", "system/netd", and "hardware/libhardware". Do not remove or replace upstream projects unless the relevant diff establishes why the fork is necessary and the fork is compatible with the selected Android 12.1 baseline.

The original manifest includes projects associated with the "K9100ii" account. The source set has not been fully resolved and approved. A repository that cannot be found in a current check should be marked unresolved—not assumed permanently deleted—and must not silently be replaced by a similarly named project.

Framework and system candidates

Component| Candidate repository / branch| Verification status
"frameworks/base"| "SeifHossam17/android_frameworks_base, lineage-19.1" (https://github.com/SeifHossam17/android_frameworks_base/tree/lineage-19.1)| Branch found; required device patches, exact diff, and compatibility with crDroid 12.1 are unverified
"system/bpf"| "SeifHossam17/android_system_bpf, android-12L" (https://github.com/SeifHossam17/android_system_bpf/tree/android-12L)| Branch found; exact required changes and compatibility with this kernel are unverified
"system/netd"| "SeifHossam17/android_system_netd, lineage-19.1" (https://github.com/SeifHossam17/android_system_netd/tree/lineage-19.1)| Branch found; exact diff and compatibility with the selected BPF source are unverified
Alternative "system/netd"| "achalmgucker/android_system_netd_k9100ii, lineage-19.1" (https://github.com/achalmgucker/android_system_netd_k9100ii/tree/lineage-19.1)| Candidate only; compare with the original manifest and other fork before selecting
Alternative "system/bpf"| "achalmgucker/android_system_bpf_k9100ii" (https://github.com/achalmgucker/android_system_bpf_k9100ii)| Reported default branch is "lineage-19.0"; no exact Android 12.1-compatible revision approved
"external/aptxenc"| "Lost-Entrepreneur439/android_external_aptxenc, lineage-19.1" (https://github.com/Lost-Entrepreneur439/android_external_aptxenc/tree/lineage-19.1)| Candidate only; verify that it is required and matches the manifest's expected source
Samsung Exynos SLSI hardware| "samsungexynos7870/android_hardware_samsung_slsi-linaro_exynos, lineage-19.1" (https://github.com/samsungexynos7870/android_hardware_samsung_slsi-linaro_exynos/tree/lineage-19.1)| Candidate only; verify related SLSI projects and Android 12L interfaces
Samsung Exynos SLSI config| "samsungexynos7870/android_hardware_samsung_slsi-linaro_config, lineage-19.1" (https://github.com/samsungexynos7870/android_hardware_samsung_slsi-linaro_config/tree/lineage-19.1)| Candidate only; confirm whether the manifest requires it and check its matching revision

A branch existing is not the same as a compatible patch set. Do not select between alternatives based only on repository names or branch names.

Required checks before approval

1. Parse the complete candidate "gtaxl.xml" and list every project path, remote URL, revision, "remove-project" entry, and copyfile/linkfile operation.
2. Confirm every required repository URL is reachable and every requested branch or tag exists. If a project is unavailable, identify a replacement only after comparing history and required changes.
3. Compare each fork against the exact crDroid 12.1 / Android 12.1 baseline, especially "frameworks/base", "frameworks/native", "system/bpf", "system/netd", "hardware/libhardware", and all SLSI hardware projects.
4. Establish why BPF/netd changes are needed for this kernel; verify that any stated eBPF limitation is supported by the kernel configuration and code rather than inferred from the repository name.
5. Audit device, common, vendor, kernel, sepolicy, HAL, VINTF, proprietary blobs, and all additional dependencies. Check interface/API compatibility, licensing, and redistribution restrictions.
6. Record the full commit SHA for every approved project and pin the final manifest to those reviewed revisions. Branch names alone are not reproducible pins.
7. Integrate the chosen platform and inspect the real product makefiles and lunch output. Confirm the build still targets "gtaxllte" / "SM-T585".
8. Run lightweight manifest/XML and source consistency checks before considering any full source sync.

Device identity guard

The target must remain "gtaxllte" / "SM-T585". Do not substitute "gtaxlwifi" / "SM-T580", which is the Wi-Fi-only model.

Build gate

Status: BLOCKED — manifest dependencies, fork diffs, and resolved revisions are not fully verified.

Until the checks above are complete:

- Keep "BASE_AUDIT_APPROVED=0".
- Do not start a full source sync or compile a release.
- Do not publish an installable-ROM claim.
- Do not flash the tablet.
- Preserve existing device backups.

No successful crDroid build or installable package has been confirmed. Once the audit is complete, update this document with evidence and exact commit SHAs before changing the build gate.