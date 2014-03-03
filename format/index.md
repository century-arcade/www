# Century Arcade

## The Century Format

The platform is the dominant hardware platform of the 1990s and 2000s (and
still, as of 2014), and it is more than sufficient to run all games made in the
20th century, even emulated.  There are several high-quality open source
emulators available.

The format has only been used for operating system installation, never for
games or other software.  But it remains a ubiquitous and convenient standard,
with almost all physical and virtual implementations of the platform supporting
it.

**The Century Format is an ISO9660 CD/DVD that is bootable on a 32-bit i686
desktop PC with a reasonable lowest common denominator of supported devices.**

Images in this format are likely to still be functional decades from now.  In
addition, all code used by the Century Arcade is open-source and the game
source materials are curated, so equivalent game images can be constructed if
they need to be ported to a different platform.

### ISO filesystem contents

   * a [`README`](readme.html) with game overview, basic instructions, credits, and an explanation of the archive contents
   * a separate [`COPYRIGHT`](copyright.html) that includes all of the required legal information
   * the original game binaries (possibly with modifications for maximum utility in any emulator--e.g. decrypted or copy protection removed)
   * just enough operating system and additional software to play
the game.  This software must be open-source and without an [overly restrictive license](http://mamedev.org/legal.html), but it can be tucked away in a hidden `boot` folder.
   * splash screen (cover art) image
   * any additional documents, images, videos, etc to complete the capsule
      - examples:  website, trailer, screenshots, maps, walkthough
   * extracurricular information should be tucked away in a directory called 'spoilers'.

These files can be accessed by mounting the image as an ISO or [unzipping the
image as a .zip file](https://github.com/century-arcade/src/tree/master/tools/mkizo).

#### File formats

Each asset should be stored in a separate and well-named file.

   * All files with textual content should be clean UTF-8.
   * Other media that includes textual content should also have that content in a clean UTF-8 text file.
   * All images should be in PNG or JPG format.
   * All audio in MP3 or FLAC format.
   * All video in MPEG2 format.

### ISO metadata

* **Preparer**: the name/email/id of the [game sponsor](/sponsor).
* **Publisher**: the publisher and year of the original game release, as well as the modern re-publisher (and current year).
* **Volumeset**: the uniquely identifying game name, original platform, and current release year (e.g. "`BELOW THE ROOT [C64] (2013)`").
* **Application**: the largest relevant software and versions (e.g. "`LINUX
 3.10.17 + UCLIBC 0.99.3.22 + VICE 2.6d`")
* Timestamps
    * **`creation_date`** should be the date of original publication of the game
    * **`modification_date`** should be the date of the modern ISO building
    * **`expiration_date`** should be `never`
    * **`effective_date`** should be date of release; in the past if rights have been released or acquired; or in the future, the date of copyright expiration.

## Technical Details

### software and boot sequence

Each ISO uses isolinux to boot a Linux kernel with an embedded initramfs.  The
initramfs contains a trimmed down BusyBox, an emulator, and a simple init which
shows a splash screen and/or plays a startup sound while it scans for hardware
and mounts the ISO.  Then it runs the emulator with a tuned config file and the
game binaries, which are plainly visible in the ISO filesystem.

