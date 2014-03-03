# Century Arcade

## Game Library

The Century Arcade has not produced any game images that meet its release
criteria.

## Test Images

The images available at the links below are for testing purposes only.

* [Below The Root](BelowTheRoot) (1984): a classic fantasy adventure game for the Commodore 64
* [Lost Pig](LostPig) (2007): a modern interactive fiction classic

## How to Play

Download and unzip the image, and use the .iso file as the boot CD in an
x86 virtual machine or emulator:

* [qemu](http://wiki.qemu.org/Download) (Linux)

        $ unzip BelowTheRoot-c64-0.75a4.izo.zip
        $ QEMU_AUDIO_DRV=alsa qemu-system-i386 -soundhw all -cdrom BelowTheRoot-c64.iso

* ~~[VMWare Player](https://my.vmware.com/web/vmware/free#desktop_end_user_computing/vmware_player/6_0) (Windows/Linux)~~ (not working yet)

* ~~[Virtualbox](https://www.virtualbox.org/wiki/Downloads) (Windows/Mac/Linux)~~ (not working yet)


## Source Code

All software included in these ISOs (except for the games themselves) is
open-source and freely available.  Most of it is licensed under the [GNU Public
License](http://www.gnu.org/licenses/gpl.html).

Source code specifically written for the Century Arcade is checked into [GitHub](http://github.com/century-arcade/src).

