- REDMI NOTE 12 PRO / PRO+ / DISCOVERY (ruby) BOOTLOADER UNLOCK GUIDE
  Automated LK-Unlock Exploit for (ruby / rubypro)


--------------------------------------------------------------------------------
DISCLAIMER & IMPORTANT PRE-CHECKS
--------------------------------------------------------------------------------
* DEVICE COMPATIBILITY & LIABILITY WARNING:
  With a few modifications, this exploit workflow can work on any Xiaomi MediaTek
  (MTK) device. however, this repository is made for and only tested on "ruby"
  (Redmi Note 12 Pro / Pro+ / Discovery 5G). do not attempt to use it with any
  other device! Otherwise, the author of this tool is not responsible for any
  damage, bricked devices, or hardware issues caused by misuse of it. Proceed entirely at your own risk!
* DATA LOSS: Unlocking the bootloader performs a full factory reset. all photos,
  apps, files, messages, and settings will be permanently wiped. Back up your
  important files to your computer or cloud before proceeding!
* BATTERY: Charge your device to at least 50% before starting. Never unplug the
  cable during read or write operations.
* CABLE & PORT: Use a good USB-C data cable. Plug directly into the rear USB ports
  of your motherboard (a USB 2.0 port is best for MediaTek BROM stability). Do
  not use unpowered USB hubs or loose front-panel ports.


[!!!] CRITICAL NOTE 1: BOOTLOADER RELOCK AFTER FLASHING ANY ROM [!!!]
--------------------------------------------------------------------------------

READ THIS CAREFULLY BEFORE FLASHING ANY ROM OR SYSTEM UPDATE:

After you flash ANY new ROM (official MIUI, HyperOS, AOSP Custom ROMs, or
fastboot/recovery update packages), the bootloader might automatically relock
itself!

DO NOT PANIC! Your phone is NOT permanently locked or broken.

All you need to do to make your ROM boot normally is reconnect the phone to
your PC and RUN THE UNLOCK SCRIPT AGAIN after the flash. Once the script finishes,
the device will boot up normally.



[!!!] CRITICAL NOTE 2: ERROR SCREENS [!!!]
--------------------------------------------------------------------------------

If the bootloader relocks itself after you flash a ROM, you will see one of
these two scary error screens:

1. IF IT WAS LOCKED ON MIUI OR HYPEROS:
   Your screen will display the error:
   "This version of MIUI can't be installed on this device"
   or
   "This version of HyperOS can't be installed on this device"

2. IF IT WAS LOCKED ON AN AOSP / CUSTOM ROM (LineageOS, PixelOS, crDroid, etc.):
   Your screen will display a black screen with red text saying:
   "The system has been destroyed"

THAT IS COMPLETELY NORMAL AND EXPECTED! YOUR PHONE IS NOT BRICKED!

Both of these errors are fixed 100% simply by running the Unlock script again
after the flash!

As soon as you re-run the unlock script, the error will disappear and the phone
will boot straight into your ROM.



EMERGENCY RESTORE SCRIPTS (IF ANYTHING GOES WRONG)


If something went wrong during the unlock process, and your device fails to boot up:

DO NOT WORRY! There is a "Restore" folder included with this tool.

If your device failed to boot, run the restore script for your operating system:
* Windows: Open the "Restore" folder, right-click "Restore.bat", and click
  "Run as administrator".
* Linux: Open a terminal in the folder and run:
  chmod +x Restore.sh && sudo ./Restore.sh

The restore script will flash your original, stock partition backups back onto
the device, returning it safely to factory working state.

--------------------------------------------------------------------------------
PREREQUISITES
--------------------------------------------------------------------------------
* Windows:
  1. Python
  2. Git
  3. Fastboot / Android USB drivers

* Linux:
  1. Install required packages using your package manager:
     - Ubuntu / Debian: sudo apt install python3 python3-pip git android-tools-fastboot libudev-dev
     - Arch / Manjaro: sudo pacman -S python python-pip git android-tools systemd-libs
  2. NOTE: "libudev" (libudev-dev / libudev1 / systemd-libs) is a required Linux dependency!

* NOTE: After installing all prerequisites, a reboot is required!


REQUIRED FILES SETUP


To respect copyright and open-source licensing laws, proprietary vendor firmware
binaries are NOT included in this repository. You MUST extract them from your
official stock Fastboot ROM before running the scripts:

1. Download the official Xiaomi Fastboot ROM (.tgz) matching the exact firmware
   version currently running on your phone.
2. Extract the downloaded Fastboot ROM package on your computer.
3. Extract and rename the following 2 files into the "bin" folder:
   - Go to the "images" folder of the extracted ROM:
     Find "preloader_ruby.bin" -> Rename it to "preloader.bin" -> Place it inside the "bin" folder.
   - Go to the the folder of the extracted ROM:
     Find "MTK_AllInOne_DA.bin" -> Rename it to "DA.bin" -> Place it inside the "bin" folder.

Make sure both "bin/preloader.bin" and "bin/DA.bin" exist before proceeding!



STEP-BY-STEP UNLOCK TUTORIAL


STEP 1 (WINDOWS): LAUNCH THE SCRIPT
-----------------------------------
1. Right-click "Unlock.bat" and select "Run as administrator".
2. When the script asks you to confirm the data wipe warning, type "Y" and press Enter.
3. The script will automatically install the bundled libusbK filter driver via
   Windows pnputil silently in the background (no popup window needed).
4. Proceed to STEP 2.


STEP 1 (LINUX): LAUNCH THE SCRIPT
---------------------------------
1. Open a terminal in the directory, make the script executable, and run with sudo:
     chmod +x Unlock.sh
     sudo ./Unlock.sh
2. When the script asks you to confirm the data wipe warning, type "Y" and press Enter.
3. Proceed to STEP 2.


STEP 2: CONNECT THE PHONE IN BROM MODE
--------------------------------------
1. Turn off your phone completely.
2. Press and hold ALL THREE physical buttons at the exact same time:
   [Volume Up] + [Volume Down] + [Power]
3. While continuing to hold down all three buttons, plug the USB-C cable into
   the phone.
4. As soon as the script detects the device and starts reading the partitions,
   you can let go of the buttons.


STEP 3: REBOOT TO FASTBOOT MODE & FINISH UNLOCK
----------------------------------------------
1. When partition flashing finishes, the script will prompt you:
   - Unplug the USB cable from the phone.
   - Wait 10 seconds with the cable unplugged.
   - Boot into Fastboot mode: Press and hold [Volume Down] + [Power] until the
     orange/yellow FASTBOOT logo appears on the screen.
   - Plug the USB cable back into the phone.
2. The script will automatically detect your phone in Fastboot, and send the unlock command.
3. The terminal will display: "Unlock success!"
4. The phone will perform a factory reset and boot up with an unlocked bootloader!

--------------------------------------------------------------------------------
CREDITS & ACKNOWLEDGMENTS
--------------------------------------------------------------------------------
This project builds upon the groundbreaking work of several open-source
developers, security researchers, and the MediaTek modding community.

For full credits, component licenses, and upstream repositories, please see:
-> CREDITS.md
