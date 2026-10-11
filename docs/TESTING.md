# Device validation checklist

Mark each item PASS / FAIL / NOT TESTED and attach logs that do not contain sensitive identifiers.

- [ ] Boot to setup wizard; no bootloop; reboot works.
- [ ] Touch, display, rotation, brightness and hardware buttons.
- [ ] Internal storage and microSD read/write.
- [ ] Wi-Fi association, reconnect and hotspot if supported.
- [ ] Bluetooth pairing, audio and reconnect.
- [ ] SIM detected; radio registration; LTE data.
- [ ] Incoming/outgoing call and SMS where available; mobile data during/after calls.
- [ ] GPS fix outdoors and navigation stability.
- [ ] Camera capture/video and flash (if applicable).
- [ ] Speaker, earpiece, microphone and headphone routing.
- [ ] Vibration service.
- [ ] Suspend/resume, overnight idle drain and screen-off stability.
- [ ] Charging, temperature and battery reporting.
- [ ] SELinux status and repeated crash/logcat errors reviewed.
- [ ] Root tested only after clean base system passes; optional Google apps/microG tested separately.

A build is not described as stable until all critical functions (especially mobile radio, suspend/resume and charging) are tested on the exact SM-T585 hardware/firmware baseline.
