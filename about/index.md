# The Century Arcade

## Mission

#### To produce modern executable images of old, bitrotten games, expected to be playable for decades to come.

* **Curated Quality**: The experience of booting an image and playing the game is carefully tuned, to be as close to the original experience as is reasonable while still keeping the game playable in a modern setting.  

* **Ready-to-play**: No operating system or other software is required; the
image itself is a bootable CD/DVD that contains everything required to play the
game.  No instructions needed other than those necessary to play the game
itself.

* **Durable Construction**: The [Century Executable Format](/src/format) is engineered to be executable on the most stable and widespread virtual hardware platform: the x86 PC.  

* **Open Source**: The entire build process is automated and made available for public usage and improvement.  See [Technical Information](/src).

* **Respect for Copyright**: For games whose copyright has been established, the Century Arcade will pay to store the images in redundant storage until they ascend into the public domain.

* **Longevity**: The Century Arcade itself will survive long enough to release its images into the public domain.

## History

*[Saul Pwanson](http://pwanson.com), curator and digital embalmer*

As a kid, I loved playing a game called [Below The Root](http://en.wikipedia.org/wiki/Below_the_Root_%28video_game%29).  In 1984, it
was one of the first graphical adventure games and an author-endorsed ending to
a fantasy trilogy from the 70s.  Not that I knew that at the time, it was just
a fun game.

In 2012, my girlfriend went to Africa for a few months, and having too much
time to myself, I started going through some files, and found the old
hand-drawn maps of *Below The Root* that I had made as a kid.  I had such fond
memories of that game, so I decided to find it and play it again.

I played a PC version like I had as a kid (using DosBox), until I learned that
the Commodore 64 version had better graphics and sound.  I figured
it would be an instant upgrade to 8-bit HD, with just a quick substitution of
emulator and game binaries.

It was not that easy.  I had to upgrade the emulator, configure it properly,
and try several different images--the third image appeared to work but then
crashed 10 minutes into the game.  Even in the best case, there were annoying
disk swap requests and load delays between screens.  After hours of frustration
with the C64 version, the experience was pretty disappointing.

So I wanted to see if I could make a single binary that would work on existing
mainstream computers, today; that did not depend on an OS or any other software
that might not be available in the future; and that would boot directly into
the game, ready-to-play (like the original PC version did).  How fast and small
could it be?

*[As of February 2014, the test image for [*Below The
Root*](/games/BelowTheRoot) is under 6MB and boots to the game in under 15
seconds.  I hope to fix the remaining issues and [release](/process) this
streamlined image to the Century Arcade by August 2014, which is the 30th
anniversary of its original release.]*

