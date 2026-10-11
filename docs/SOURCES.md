# Source audit — SM-T585 / gtaxllte

## Confirmed public references

| Component | Repository / branch | Audit notes |
|---|---|---|
| Device tree | https://github.com/miikaoskari/android_device_samsung_gtaxllte/tree/lineage-19.1 | Contains `TARGET_OTA_ASSERT_DEVICE := gtaxllte`; `device.mk` includes radio/RIL, GPS configs and vibrator service packages. |
| Vendor tree | https://github.com/miikaoskari/android_vendor_samsung_gtaxllte/tree/lineage-19.1 | Matching LTE vendor repository; review redistribution/licensing before copying binaries elsewhere. |
| Family manifest | https://github.com/gargomoma/gtaxl-manifests/tree/lineage-19.1 | Its `roomservice.xml` lists common/device/vendor trees, `android_kernel_samsung_exynos7870`, SLSI hardware repositories and selected forks. |
| Original device tree | https://github.com/Valera1978/android_device_samsung_gtaxllte/tree/lineage-17.1 | Older Android 10 baseline / reference only, not a drop-in modern tree. |
| Device ROM hub | https://github.com/ZORO2045/SM-T585-Custom-ROMs | Helpful source/index; verify exact asset/model/build before using any release. |
| crDroid manifest | https://github.com/crdroidandroid/android/tree/17.0 | Inspected manifest currently advertises 17.0. Device support for `gtaxllte` not confirmed. |

## Known pitfalls

1. `gtaxllte` = SM-T585 LTE. `gtaxlwifi` = SM-T580 Wi-Fi-only. Do not interchange installable packages.
2. The Android 12L family manifest includes forked `frameworks/base` and Permission-module changes for signature spoofing and includes bpf/netd changes due to kernel eBPF limitations. These are not automatically required for base crDroid. Audit and justify each fork before using it.
3. Do not combine Android 12L device/vendor/kernel configuration with a much newer crDroid branch without an explicit compatibility plan. The currently inspected crDroid branch `17.0` is a different Android generation.
4. The current device tree points to an older stock build description and needs actual build testing. Metadata alone cannot show runtime compatibility.
5. Before building, inspect the kernel fork and exact branch/revision. The existence of a modern custom kernel release does not prove it is compatible with the selected crDroid base.

## Selection rule

Choose the highest Android/crDroid base for which the device, common, vendor, kernel and required HAL/config trees can be reconciled and built reproducibly. Prefer a stable compatible base over choosing a version number solely because it is newer.
