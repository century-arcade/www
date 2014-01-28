# RFH 2: [C64] sound not working

# Request For Help

## Summary
*updated 2014/1/26*

* VICE using SDL using ALSA does not work: sound initialization error
* tinyplay using raw /dev/pcm I/O plays a sound successfully
* VICE using alsa-lib: no sound output
* static-linked aplay (from alsa-utils) does not work:

        ALSA lib pcm_dmix.c:985:(snd_pcm_dmix_open) unable to create IPC semaphore
        aplay: main:696: audio open error: Function not implemented

### Debug Image

*to be produced* [BelowTheRoot-c64-debug.iso](BelowTheRoot-c64-debug.iso)

* full busybox, gdb
* alsaplay->tinyplay, sdlplay->playwave -ggdb
* sample.wav

        # tinyplay startup.wav    **this works**
        # aplay startup.wav    **this does not**

### Does VICE with SDL work?  *NO*
*2014/1/12*

VICE reports "Sound: SDL initialization for device '@sdl' failed." and sound
does not work.  (See [Below The Root](http://games.century-arcade.org/BelowTheRoot), although the sound is disabled in 0.71a3.)

VICE is configured with `--with-sdlsound` and run with `SDL_AUDIODRIVER=alsa`
and `-sounddev sdl`.

### Does Linux audio (currently ALSA) work at all?  *YES*

* `tinyalsa/tinyplay` **does** play a sound via raw /dev/snd/pcm* I/O

### Does SDL sound work at all? *NO*

* `SDL_mixer/playwave` reports "Couldn't open audio: **No available audio device.**"  (bold text from SDL_GetError).  `SDL_AUDIODRIVER=alsa`.

* playwave is statically linked and no libs are in the embedded environment.
Running these same binaries of tinyplay and playwave on the Ubuntu
development machine has the same effect.  

* strace of playwave (desktop) only has these log entries relevant to sound:

    `ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon echo ...}) = 0`

    `ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon echo ...}) = 0`

### Does VICE work with ALSA directly? *NO*

Not an ideal solution, but a reasonable test.

* vice `./configure --with-alsa` fails alsa check silently, due to no alsa/asoundlib.h.  need to make alsa-lib.
  * adding `BR2_PACKAGE_ALSA_LIB=y` to buildroot.config results in a link error during toolchain setup of `alsa-lib/aserver`:

    `/opt/arcade/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(vfork.o): In function '__vfork':
(.text+0x0): multiple definition of '__vfork'`

    `/opt/arcade/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/lib/libpthread.a(pt-vfork.o):__vfork:(.text+0x0): first defined here`

  * [This buildroot post](http://lists.busybox.net/pipermail/buildroot/2013-August/077020.html) is one of the few pages found with this error.  (It looks like alsa-lib requires dlopen?)
  * threads (NPTL) were enabled in both uclibc (`UCLIBC_HAS_THREADS_NATIVE`) and buildroot (`BR_PTHREADS_NONE=n`); setting uclibc `HAS_NO_THREADS=y` did not change the outcome.
     * setting `BR_PTHREADS_NONE=y` and `UCLIBC_HAS_THREADS=n` (`HAS_NO_THREADS=y`) yields missing pthread.h in gcov (with gcc).  and uclibc depends on gcc.  `BUILDROOT_PTHREADS=y` and change `UCLIBC_HAS_THREADS_NATIVE` to `UCLIBC_HAS_THREADS` successfully builds libasound.a.
     
* *2014/1/23*: **VICE with ALSA still does not play sound.**
  * alsa is a valid output option in SDL, but using it still does not play any sound.

### Test: Does alsaplay work if built statically?

        ALSA lib conf.c:3705:(snd_config_update_r) Cannot access file /usr/share/alsa/alsa.conf
        ALSA lib pcm.c:2217:(snd_pcm_open_noupdate) Unknown PCM default

(resolved by copying /usr/share/alsa/alsa.conf (eventually -R /usr/share/alsa) from buildroot target to initramfs)

        ALSA lib pcm_direct.c:1624:(snd1_pcm_direct_parse_open_conf) The field ipc_gid must be a valid group (create group audio)

(resolved by copying /etc/group from buildroot target to initramfs)
    
        ALSA lib pcm_dmix.c:985:(snd_pcm_dmix_open) unable to create IPC semaphore
        aplay: main:696: audio open error: Function not implemented

**unsolved**  Does the [uclibc configuration](https://github.com/century-arcade/src/blob/master/uclibc.config) not support seamphores?

---
Any help in making progress on this issue would be very much appreciated.

