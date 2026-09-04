<h1 align="center">🔓 Redmi Note 12 Pro / Pro+ / Discovery (ruby) Bootloader Unlock</h1>

<p align="center">
  <b>Automated LK-Unlock Exploit for <code>ruby</code> / <code>rubypro</code></b>
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-AGPL_v3-blue.svg" alt="License: AGPL v3"></a>
  <img src="https://img.shields.io/badge/Device-Redmi_Note_12_Pro%20%2F%20Pro%2B%20(ruby)-orange.svg" alt="Device: ruby">
  <img src="https://img.shields.io/badge/SoC-MediaTek_Dimensity_1080-red.svg" alt="SoC: Dimensity 1080">
  <img src="https://img.shields.io/badge/Platform-Windows%20%7C%20Linux-brightgreen.svg" alt="Platform">
</p>

---

## ⚠️ Disclaimers & Pre-Checks

> [!WARNING]
> **Device compatibility & liability warning:**  
> With a few modifications, this exploit workflow can work on any Xiaomi MediaTek (MTK) device. **However, this repository is configured for and only tested on "ruby" (Redmi Note 12 Pro / Pro+ / Discovery 5G).**  
> Do not attempt to use it with any other device. The author of this tool is not responsible for any damage, bricked devices, or hardware issues caused by misuse of it. Proceed entirely at your own risk.

> [!CAUTION]
> **Data loss warning:**  
> Unlocking the bootloader performs a full factory reset. All photos, apps, files, messages, and settings will be permanently wiped. Back up your important files to your computer or cloud before proceeding.

* **Battery:** Charge your device to at least 50% before starting. Never unplug the cable during read or write operations.
* **Cable & port:** Use a reliable USB-C data cable. Plug directly into the rear USB ports of your motherboard (a USB 2.0 port is best for MediaTek BROM stability). Do not use unpowered USB hubs or loose front-panel ports.

---

## 🚨 Critical Notes

> [!IMPORTANT]
> ### 1. Bootloader relock after flashing any ROM
> **Please read this before flashing any ROM or system update:**  
> After you flash a new ROM (official MIUI, HyperOS, custom AOSP ROMs, or fastboot/recovery packages), the bootloader might automatically relock itself because the LK partition gets overwritten.
> 
> **Don't panic! Your phone is not permanently locked or broken.**  
> Simply reconnect the phone to your PC and run the unlock script again after flashing. Once the script finishes, the device will boot normally.

> [!NOTE]
> ### 2. Expected error screens
> If the bootloader relocks itself after you flash a ROM, you will see one of these two warning screens:
> 
> 1. **If locked on official MIUI or HyperOS:**  
>    `"This version of MIUI can't be installed on this device"` or  
>    `"This version of HyperOS can't be installed on this device"`
> 2. **If locked on an AOSP / Custom ROM (LineageOS, PixelOS, crDroid, etc.):**  
>    Black screen with red text: `"The system has been destroyed"`
> 
> **This is completely normal and expected.** Your phone is not bricked. Both of these errors disappear simply by running the unlock script again.

---

## 🔄 Emergency Restore Scripts

If something goes wrong during the unlock process and your device fails to boot up, a `Restore/` folder is included to flash your original stock partition backups back onto the device:

* **Windows:** Open the `Restore` folder, right-click `Restore.bat`, and select **Run as administrator**.
* **Linux:** Open a terminal in the folder and run:
  ```bash
  chmod +x Restore.sh && sudo ./Restore.sh
  ```

---

## 📦 Requirements

### Windows
1. Python (make sure it is added to your system PATH)
2. Git
3. Fastboot / Android USB drivers
4. MediaTek VCOM USB drivers

### Linux
1. Install the required packages using your package manager:
   * **Ubuntu / Debian:** `sudo apt install python3 python3-pip git android-tools-fastboot libudev-dev`
   * **Fedora / RHEL:** `sudo dnf install python3 python3-pip git android-tools systemd-devel`
   * **Arch / Manjaro:** `sudo pacman -S python python-pip git android-tools systemd-libs`
2. *Note:* `libudev` (`libudev-dev` / `systemd-devel` / `systemd-libs`) is a required Linux dependency.

> [!TIP]
> After installing all requirements for the first time, a system reboot is required.
---

## 📁 Required Files Setup

To respect copyright and open-source licensing laws, proprietary vendor firmware binaries are **not** included in this repository. You must extract them from your official stock Fastboot ROM before running the scripts:

1. Download the official Xiaomi Fastboot ROM (`.tgz`) matching the exact firmware version currently running on your phone.
2. Extract the downloaded Fastboot ROM package on your computer.
3. Extract and rename the following 2 files into the `bin` folder:
   * From the `images/` folder of the extracted ROM:  
     Find `preloader_ruby.bin` ➔ **Rename to:** `preloader.bin` ➔ Place inside the `bin` folder.
   * From the root folder of the extracted ROM:  
     Find `MTK_AllInOne_DA.bin` ➔ **Rename to:** `DA.bin` ➔ Place inside the `bin` folder.

Make sure both `bin/preloader.bin` and `bin/DA.bin` exist before proceeding.

---

## 🚀 Step-by-Step Unlock Tutorial

### Step 1 (Windows): Launch the script
1. Right-click `Unlock.bat` and select **Run as administrator**.
2. When prompted by the data wipe warning, type `Y` and press Enter.
3. Proceed to Step 2.

### Step 1 (Linux): Launch the script
1. Open a terminal in the directory, make the script executable, and run with sudo:
   ```bash
   chmod +x Unlock.sh
   sudo ./Unlock.sh
   ```
2. When prompted by the data wipe warning, type `Y` and press Enter.
3. Proceed to Step 2.

---

### Step 2: Connect the phone in BROM mode
1. Turn off your phone completely.
2. Press and hold all three physical buttons at the exact same time:  
   `[Volume Up]` + `[Volume Down]` + `[Power]`
3. While continuing to hold down all three buttons, connect the USB-C cable to the phone.
4. As soon as the script detects the device and starts reading the partitions, release the buttons.

---

### Step 3: Reboot to Fastboot mode & finish unlock
1. When partition flashing finishes, the script will prompt you:
   * Unplug the USB cable from the phone.
   * Wait 10 seconds with the cable unplugged.
   * Boot into Fastboot mode: Press and hold `[Volume Down]` + `[Power]` until the orange/yellow fastboot logo appears.
   * Reconnect the USB cable.
2. The script will automatically detect your phone in Fastboot and send the unlock command.
3. The terminal will display: `Unlock success!`
4. The phone will perform a factory reset and boot up with an unlocked bootloader.

---

## 📜 Credits & Acknowledgments

This project is made possible thanks to the groundbreaking research, tools, and libraries developed by the open-source community, security researchers, and reverse engineers:

### Core Exploit & LK Patching
* **Georgiy Nesterov ([@georgiynesterov](https://github.com/georgiynesterov))** — Creator of [lk-unlock](https://github.com/georgiynesterov/lk-unlock), the foundational research and tool for patching the OEM public key modulus in the MediaTek Little Kernel (LK) to forge fastboot unlock signatures.
* **R0rt1z2 ([@R0rt1z2](https://github.com/R0rt1z2))** — Author of [liblk](https://github.com/R0rt1z2/liblk), providing low-level parsing, manipulation, and certificate chain bypass for MediaTek LK images.

### BROM Exploitation & Flashing Engine
* **shomykohai ([@shomykohai](https://github.com/shomykohai))** — Creator of [penumbra](https://github.com/shomykohai/penumbra) and the Antumbra CLI/TUI, providing the high-speed Rust-based MediaTek BootROM communication engine used to dump and flash partitions.
* **Bjoern Kerler ([@bkerler](https://github.com/bkerler))** — Creator of [mtkclient](https://github.com/bkerler/mtkclient) and pioneer of modern open-source MediaTek reverse engineering and payload delivery.

### USB Drivers & Connectivity
* **Travis Robinson & the libusbK Team** — Authors of [libusbK](https://github.com/mcuee/libusbk) and [libusb-win32](http://libusb-win32.sourceforge.net), enabling open-source, filter USB communication with MediaTek hardware in BootROM mode on Windows.

### Testers & Device Verification
The following individuals helped test and verify this exploit on real hardware:
* *(Add your device testers here)*

### Special Thanks
* *(Add friends, mentors, or contributors who helped you)*
* **XDA Developers & 4PDA Communities** — For ongoing Android research, partition documentation, and device testing.
* **The wider MediaTek & Xiaomi modding community** — For keeping Android devices open and accessible.

---

## 📄 License

This project is licensed under the **GNU Affero General Public License v3.0** — see [LICENSE](LICENSE) for details.
