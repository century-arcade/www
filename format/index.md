# Anatomy of the Century Arcade Format

The base platform described here has been virtually unchanged for more than 20
years and is now a dominant hardware platform.  It is more than sufficient to
run all games of the 80s and 90s.

The format described here is usually only used for general purpose OS
installation, but it is a ubiquitous and convenient standard. 

This format, then, is the most likely to still be functional in 100 years.  If
it does happen to fall into disfavor, the code is open-source and the game
source materials are curated, so the games can be more easily ported to
whatever format and platform take its place.

## one game, one CD/DVD [ISO9660] image

## technical overview

Each ISO uses isolinux to boot a Linux kernel which never pivots the root away
from its initramfs.  The initramfs contains a trimmed down BusyBox, an
emulator, and a simple init which shows a splash screen and plays a startup
sound while it scans for hardware and mounts the ISO.  Then it runs the
emulator with a tuned config file and the game binaries, which are plainly
visible if the ISO is mounted.

The ISO also contains README, LICENSE/COPYRIGHT, and other additional
documentation or resources that have been collected and form the complete game.
These files can be accessed by mounting the image as an ISO or [unzipping the image as a .zip file]()

The ISO image for a Commodore 64 game is under 5MB and it boots in qemu on
modern hardware in under 5 seconds.

### game is ready-to-play in a modern vm in seconds

### displays splash screen of original game cover art while loading

### meaningful ISO metadata

#### Preparer ID 

Each game image has a sponsor, a person (or group of people) who was
responsible for the production of the image and thus the quality of the
resulting experience.  They drive the parts of the process that they aren''t
doing themselves.  They sign off on the final ISO and deliver the image to the
publisher.

The Preparer field should be filled in with the name/email/id of the
game Sponsor.

#### Publisher ID

The Publisher ''owns'' the copyright to the ISO image itself and is 
legally responsible for the content.  

The publisher field should include the prior publishers of the game content (and years), and the publisher of the ISO remaster

#### Volumeset ID (128 chars)

The volumeset id should include the uniquely identifying game name, original
platform, and current release year ("BELOW THE ROOT [C64] (2013)").

Volumeset size and volume sequence number are always 1 (or 0?).  The volumeset
must be complete in one volume.

The maximum ISO size is 4.3GB, or the maximum ISO size of the major vmplayers.

#### Application ID (128 chars)

the application_id should include the largest relevant software (i.e. "LINUX
 3.10.17 + UCLIBC 0.99.3.22 + VICE 2.6d") and their versions.

### dates

    * creation_date should be the date of original publication of the game
    * modification_date should be the date of ISO building
    * expiration_date should be never
    * effective_date should be date of release; in the past if rights have been released or acquired; or in the future, the date of copyright expiration.


## ISO filesystem contents

   * original game binaries (possibly with modifications for maximum utility in any emulator--i.e. copy protection removed)
   * README with abstract, instructions, credits, and copyright information
   * splash screen (cover art) image
   * any additional documents, images, videos, etc to complete the capsule
      - examples:  website, trailer, screenshots, maps, walkthough

   All textual content should be straight UTF8, or PDF if print-ready (uncompressed).
   All additional images should be in PNG format.
   All audio in mp3 or FLAC.
   All videos in MPEG2 format.

## Target Platform

### x86 (targeted to i686 generic)

### superset of every major (>10% market share) vmplayer

   auto-detect available devices
   assume user has just used defaults

### ISO contains bespoke kernel and emulator

## Source code

  All code and data on the ISO has unrestrictive licenses, with the exception
  of the game content itself and the hardware ROMs.  If the original game
  images become legally allowed to distribute and/or resell, then the licensing
  of the rest of the content would not prevent that.

## Gold-plating

### ISO is also a ZIP of the game contents and metadata

The ISO is post-processed to add ZIP headers to all the relevant files [in the
root filesystem].  On systems which can''t mount ISOs directly, the file can be
renamed to .zip and the game data and metadata extracted.  All game files are
stored uncompressed in the ISO, and so the .zip is also uncompressed.  This
hybrid format is called an IZO (though it still has the .iso extension).

### seal the IZO with a SHA1 vanity hash

A small area of junk data is modified randomly, searching for an IZO with a
hash that has a specific prefix (8 hex digits takes a few hours of compute
time).  The Century Arcade reserves the prefix '10decade' for its own releases.


### IZO is then compressed into a one-file archive.
