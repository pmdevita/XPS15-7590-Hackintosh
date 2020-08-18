# Dell XPS15 7590 Hackintosh

CloverEFI config/DSDT/kexts for running MacOS on the Dell XPS 15 7590

Huge thanks to [daliansky](https://github.com/daliansky) who did most of the legwork here.

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
* At least basic processor power management
* WiFi
* Sleep
* Webcam
* Battery Status
* Trackpad/Keyboard with gestures/shortcuts

### Not working

* HDMI audio
* Hot-plug HDMI display
* ~~Headphone jack after sleep~~ See notes
* ~~Poor battery life (\~3 hours)~~ See notes

### Will never work

* Nvidia Graphics
* Fingerprint reader
* SD Card reader
* Original Killer WiFi (See notes)

### Notes

#### Battery Life

The problem seems to have been caused the by the Nvidia GPU turning on after waking from sleep. This has been fixed so now we'll see if that's all the problem was (testing hasn't been exactly thorough)

#### Headphones after sleep

Switching from layout-id 72 to 28 seems to have solved the issue, will mark it off if it seems to stick

#### Wi-FI

I'm using the DW1820A. However, this card requires pin masking to enable full power management, which is a hassle and a risk and is therefore not a recommended card. You may want to choose something else from [here](https://dortania.github.io/Wireless-Buyers-Guide/types-of-wireless-card/m2.html)). You'll then want to disable the power management patch (pci-aspm) in the config.plist for Wi-Fi.

For those of you who decide to go with this card anyways, the config already has a patch to disable power management so you can use the card. Do note that without full power management, the card pulls like another 4W so it's not great for battery life. If you want to try pin masking, google "DW1820A Hackintosh pin masking" and be ready for the challenge. If you pass though, you can disable the power management patch (pci-aspm) and get full power management. Pin masking seems to have no effect on Windows but I'm currently running into Wi-Fi problems in Linux that I'm not sure are related.


## Sources

This would not have been possible without hundreds of hours of time from developers and other gurus.

### Config

* bavariancake
* daliansky

### DSDT/SSDTs

* bavariancake
* daliansky

### Kexts

#### [acidanthera](https://github.com/acidanthera)

* Lilu
* VoodooPS2 (also Rehabman and other ≈original developers)
* AppleALC
* WhateverGreen
* Lilu
* VirtualSMC
* AirportBrcmFixup
* HibernationFixup
* CPUFriend

#### [alexandred](https://github.com/alexandred)

* VoodooI2C

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
