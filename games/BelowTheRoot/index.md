# [Below The Root](http://en.wikipedia.org/wiki/Below_the_Root_(video_game\)) (1984) 

Below The Root is a classic software fantasy game from 1984.  I used to love playing
this game on the PC, but the Commodore 64 version has better graphics and sound.

It is easy to find several versions of the C64 game that have various issues,
and even if you do persist to get them working, they bug you with frequent disk
swap requests and might even crash after you've just started to get into the
game again.

This implementation is a Linux live/bootable ISO that loads a tuned image
of the original game disk into VICE (a C64 emulator) with all of the correct
options pre-selected.

---
*2014/1/9*  version 0.71a3

The most recent image for testing is [BelowTheRoot-c64-0.71a3.izo.zip](BelowTheRoot-c64-0.71a3.izo.zip) (5.4MB).

This image has been tested with qemu and
[Virtualbox](https://www.virtualbox.org/wiki/Downloads), and should work in
VMWare and all other x86 emulators and virtual machines.

### qemu (Linux)

    $ unzip BelowTheRoot-c64-0.71a3.izo.zip
    $ qemu-system-i386 -cdrom BelowTheRoot-c64-0.71a3.iso

The game is ready to play in 12 seconds.

The joystick is emulated with the arrow keys, with 'X' as the trigger.

Sound does not work yet.

---
