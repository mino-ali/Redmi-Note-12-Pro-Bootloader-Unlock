# Credits and Acknowledgments

This project is made possible thanks to the groundbreaking research, tools, and libraries developed by the open-source community, security researchers, and reverse engineers.

---

## Core Exploit & LK Patching

* **Georgiy Nesterov ([@georgiynesterov](https://github.com/georgiynesterov))**
  * **Project:** [lk-unlock](https://github.com/georgiynesterov/lk-unlock)
  * **Contribution:** Creator of the foundational `lk-unlock` research and Python tool for unlocking Xiaomi MediaTek bootloaders by patching the OEM public key modulus in the Little Kernel (LK) and forging the fastboot unlock token signature.
  * **License:** GNU AGPLv3

* **R0rt1z2 ([@R0rt1z2](https://github.com/R0rt1z2))**
  * **Project:** [liblk](https://github.com/R0rt1z2/liblk)
  * **Contribution:** Author of the `liblk` library, providing low-level parsing, manipulation, and certificate chain bypass for MediaTek LK images.
  * **License:** GNU GPLv3

---

## BROM Exploitation & Flashing Engine

* **shomykohai ([@shomykohai](https://github.com/shomykohai))**
  * **Project:** [penumbra](https://github.com/shomykohai/penumbra) (Antumbra CLI)
  * **Contribution:** Creator of Penumbra and the Antumbra CLI/TUI, providing the high-speed Rust-based MediaTek BootROM communication engine used to dump and flash partitions.
  * **License:** GNU AGPLv3

* **Bjoern Kerler ([@bkerler](https://github.com/bkerler))**
  * **Project:** [mtkclient](https://github.com/bkerler/mtkclient)
  * **Contribution:** Pioneer of modern open-source MediaTek reverse-engineering, payload delivery, and BROM handshake research that laid the foundation for community MTK tooling.
  * **License:** GNU GPLv3

---

## USB Drivers & Connectivity

* **Travis Robinson & the libusbK Team**
  * **Project:** [libusbK](https://github.com/mcuee/libusbk) & [libusb-win32](http://libusb-win32.sourceforge.net)
  * **Contribution:** Authors of the open-source `libusbK` driver and user-mode libraries, enabling driverless/filter USB communication with MediaTek hardware in BootROM mode on Windows.
  * **License:** Dual-licensed GNU GPLv3 / 2-Clause BSD (LGPLv2.1+ for libusb0)

---

## Project Packaging & Ruby Adaptation

* **mino_ali**
  * **Contribution:** Adapting, testing, and automating the exploit workflow specifically for the Redmi Note 12 Pro / Pro+ / Discovery (`ruby` / `rubypro`), creating the one-click Windows (`Unlock.bat`) and Linux (`Unlock.sh`) automation, emergency restore scripts (`Restore/`), and user documentation.
  * **License:** GNU AGPLv3

---

## Testers & Device Verification

The following individuals helped test, verify, and confirm this exploit on real devices:

* *(Add your device testers here)*
* *(Example: Name / Telegram handle / GitHub profile - Tested on Redmi Note 12 Pro 5G)*
* *(Example: Name / Telegram handle / GitHub profile - Tested on Redmi Note 12 Discovery)*

---

## Special Thanks

* *(Add friends, mentors, or contributors who helped you with scripts or troubleshooting)*
* *(Add any community members who provided dump files or debugging feedback)*
* **XDA Developers & 4PDA Communities:** For ongoing Android research, partition documentation, and device testing.
* **The wider MediaTek & Xiaomi modding community:** For keeping Android devices open and accessible to their owners.
