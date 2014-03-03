# [Below The Root](http://en.wikipedia.org/wiki/Below_the_Root_(video_game\)) (1984) 

Below The Root is a classic fantasy adventure game.  I used to love playing
this game on the PC, but the Commodore 64 version has more colors and
polyphonic sound.

It is easy to find several versions of the C64 game that have various issues,
and even if you do persist to get them working, they bug you with frequent disk
swap requests and might even crash after you've just started to get into the
game again.

This implementation is a Linux live/bootable ISO that loads a tuned image of
the original game disk into the VICE Commodore 64 emulator with all of the
correct options pre-selected.

---
*2014/3/2*  version 0.75a4

The most recent image for testing is [BelowTheRoot-c64-0.75a4.izo.zip](BelowTheRoot-c64-0.75a4.izo.zip) (5.6MB).

This image has been tested with qemu on Linux, and does not work in VMWare or VirtualBox yet.

### qemu (Linux with alsa sound)

    $ unzip BelowTheRoot-c64-0.75a4.izo.zip
    $ QEMU_AUDIO_DRV=alsa qemu-system-i386 -soundhw all -cdrom BelowTheRoot-c64.iso

Sound is now working.

The joystick is emulated using the arrow keys for direction and the spacebar as
the trigger.

The game is ready to play in 12 seconds.


