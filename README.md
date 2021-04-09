# Dell XPS15 7590 Hackintosh (Clover/10.15)

CloverEFI config/DSDT/kexts for running MacOS on the Dell XPS 15 7590. Check the other branch for the work on moving to OpenCore and macOS 11. This branch is going to stop being supported as soon as OC/11 is working.

Huge thanks to [daliansky](https://github.com/daliansky) who did most of the legwork here. I also redid several of the SSDTs to double check his work but I came up with pretty much the same things he did.

I occasionally update this repo with fixes and new drivers that I have tested so check back every few months. You can see what I've changed recently in the [commit log](https://github.com/pmdevita/XPS15-7590-Hackintosh/commits/master)

## System Configuration

This was built and tested using an XPS 15 7590 configured as follows

* i7-9750H
* FHD panel
* Samsung 970 EVO NVMe
* DW1820A WiFi (See notes)

If you have an SK Hynix NVMe drive you will need to swap it with something that is Mac compatible. 
Everyone needs to swap their wifi for the DW1820A card, which you can find for around $15 on eBay.

If you are using a different processor or display, your mileage may vary. From what I have read, the OLED panel 
is having brightness control problems right now.

## Installation

Follow whichever Clover installation path you use and then replace the CLOVER folder in the EFI with this one

## What's working/not working

### Working

* Audio
* Display/Intel Graphics
* Pretty good power management (see notes)
* WiFi (Replacement card, see notes)
* Sleep
* Webcam
* Battery Status
* Trackpad/Keyboard with gestures/shortcuts
* Brightness keys

If these things are not working for you then open an issue.

### Not working

* HDMI/USB-C video out (see notes)

If you have any info on how to fix this, open an issue.

### Will never work

* Nvidia Graphics
* Fingerprint reader
* SD Card reader
* Original Killer WiFi (See notes)

### Notes

#### Battery Life

Battery life isn't perfect but you can get some decent results. 

* Disable SD card and Thunderbolt in BIOS (you can re-enable if needed but they just passively draw power)
* [Disable CFG Lock](https://github.com/pmdevita/XPS15-7590-Hackintosh/issues/2)
* Use [coconutBattery](https://www.coconut-flavour.com/coconutbattery/) to see what your power draw in watts is.


#### Headphones after sleep

~~Follow the guide [here](https://github.com/pmdevita/XPS15-7590-Hackintosh/issues/3)~~ UPDATE: Go to that guide and follow the instructions to uninstall, more details there. If you never installed ALCPlug298 then you should be good to go on my latest EFI

#### Wi-FI

I'm using the DW1820A. However, this card requires pin masking to enable full power management (literally, masking the pins on the card with tape), which is a hassle and a risk and therefore it is not a recommended card. Choose something else from [here](https://dortania.github.io/Wireless-Buyers-Guide/types-of-wireless-card/m2.html)). You'll then want to disable the power management patch (pci-aspm) in the config.plist for Wi-Fi.

For those of you who decide to go with this card anyways, the config already has a patch to disable power management so you can use the card. Do note that without full power management, the card pulls like another 4W so it's not great for battery life. If you want to try pin masking, google "DW1820A Hackintosh pin masking" and be ready for the challenge. If you pass though, you can disable the power management patch (pci-aspm) and get full power management. Pin masking seems to have no effect on Windows or Linux (but apparently this card is a little buggy in Linux so that's another reason to avoid it).

#### HDMI/Display Out

The XPS 15 has some odd display out hardware (LSPCON) and while the community has written some driver support, it is still lacking ([see here](https://github.com/bavariancake/XPS9570-macOS#audio)).

Here's the rundown:

* HDMI port: No hotplugging, no audio
* Display out over USB-C: Hotplugging allowed, no audio

I can't make any guarantees since I don't know for sure but at some point I will be taking a look into patching WhateverGreen to completely fix this.

## Sources

This would not have been possible without hundreds of hours of time from developers and other gurus.

### Config

* bavariancake
* daliansky
* Other XPS 15 7590 config makers (I'll add them later)

### DSDT/SSDTs

* bavariancake
* daliansky

### Kexts

#### [acidanthera](https://github.com/acidanthera)

* Lilu
* VoodooPS2 (also Rehabman and other original developers)
* AppleALC
* WhateverGreen
* Lilu
* VirtualSMC
* AirportBrcmFixup
* HibernationFixup
* CPUFriend
* NVMeFix
* VirtualSMC
* BT4LEContinuityFixup
* BrcmPatchRAM
* CPUFriend

#### [alexandred](https://github.com/alexandred)

* VoodooI2C

#### Dolnor

* CodecCommander (also Rehabman)

#### al3xtjames

* NoTouchID

#### RehabMan

* USBInjectAll


... and a few more I'll add later



# Original Readme (from daliansky)

## 电脑配置

| 规格     | 详细信息                                                     |
| -------- | ------------------------------------------------------------ |
| 电脑型号 | DELL XPS 15 7590                                             |
| 操作系统 | macOS Catalina 10.15 / macOS Mojave 10.14                    |
| 处理器   | Intel(R) Core(TM) i7-9750H                                   |
| 内存     | 16GB                                                         |
| 硬盘     | KXG60ZNV1T02 NVMe TOSHIBA 1024GB                             |
| 显卡     | Intel UHD Graphics 630(0x3e9b0000)                           |
| 显示器   | 15.6" 1920x1080                                              |
| 声卡     | Realtek ALC298                                               |
| 网卡     | 更换为 [DW1820A](https://blog.daliansky.net/DW1820A_BCM94350ZAE-driver-inserts-the-correct-posture.html) |

## 截屏

![1](screenshot/1.png)

![2](screenshot/2.png)

![3](screenshot/3.png)

![4](screenshot/4.png)

![5](screenshot/5.png)

![6](screenshot/6.png)

![7](screenshot/7.png)
