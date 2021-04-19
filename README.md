# Dell XPS 15 7590 Hackintosh (OpenCore/10.15+)

![Screenshot](https://i.imgur.com/5EK9d1x.png)

Here is my OpenCore config (and old CloverEFI config for now) I made for my XPS 15 7590. I started and referenced a lot from [daliansky](https://github.com/daliansky) build but I redid or validated a lot of their work.

I occasionally update this repo with fixes and new drivers that I have tested so check back every few months. You can see what I've changed recently in the [commit log](https://github.com/pmdevita/XPS15-7590-Hackintosh/commits/master).

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
* Headphones plugged in while sleeping will have to be plugged in again after resuming

If you have any info on how to fix this, open an issue.

### Will never work

* Nvidia Graphics
* Fingerprint reader
* SD Card reader
* Original Killer WiFi (See notes)

## Instructions

1. Read and follow the Dortania guides. This config is more of a reference for how the laptop should be configured, you should still know the process as if you were doing it.

2. Use GenSMBIOS to create new SMBIOS keys for your config.

3. Specific notes for certain hardware

- WiFi - If you are using the DW1820A card and haven't masked your pins OR if you are not using this card at all, delete the `brcmfx-aspm` property.
- CFG Lock - If you haven't removed your CFG Lock, make sure `AppleXcpmCfgLock` is True.

## Notes

### CFG Lock

[See here](https://github.com/pmdevita/XPS15-7590-Hackintosh/issues/2)

#### Battery Life

Idle power draw is comparable to Windows if you disable SD Card, Thunderbolt(?), and USB PowerShare in the BIOS (SD Card and USB PowerShare each add about a watt so they are quite useful to disable). 
* [Disable CFG Lock](https://github.com/pmdevita/XPS15-7590-Hackintosh/issues/2)
* Use [coconutBattery](https://www.coconut-flavour.com/coconutbattery/) to see what your power draw in watts is.

At about half brightness and idle, I was able to get down to about 5.2W which is pretty good for a Hackintosh laptop from what I understand. Windows gets about 5.1W when idle on my computer so it's pretty close.

#### Headphones after sleep

If you were using ALCPlugFix, go follow the instructions [here](https://github.com/pmdevita/XPS15-7590-Hackintosh/issues/3) to remove it.

#### Wi-FI

The instructions above tell you how to edit the config based on your Wi-Fi card, here is some more specific information.

I'm using the DW1820A. However, this card requires pin masking to enable full power management (literally, masking the pins on the card with tape), which is a hassle and a risk and therefore it is not a recommended card. Choose something else from [here](https://dortania.github.io/Wireless-Buyers-Guide/types-of-wireless-card/m2.html)).

For those of you who decide to go with this card anyways, do note that without full power management, the card pulls like another 4W so it's not great for battery life. If you want to try pin masking, google "DW1820A Hackintosh pin masking" and be ready for the challenge.

#### HDMI/Display Out

The XPS 15 has some odd display out hardware (LSPCON) and while the community has written some driver support, it is still lacking ([see here](https://github.com/bavariancake/XPS9570-macOS#audio)).

Here's the rundown:

* HDMI port: No hotplugging, no audio
* Display out over USB-C: Hotplugging allowed, no audio

I can't make any guarantees since I don't know for sure but at some point I will be taking a look into patching WhateverGreen to fix this.

## Sources

This would not have been possible without hundreds of hours of time from developers and other gurus.

### Config

* bavariancake
* daliansky
* giugrilli
* geek5nan

### SSDT references

* bavariancake
* daliansky
* Dortania guides

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

