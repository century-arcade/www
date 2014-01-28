VOLS = Below_The_Root
PUBL = Windham Classics (1984); Century Arcade (2014)
PREP = Saul Pwanson <saul@pwanson.com>

#BOOT_LOGO = $(ARCADE)/src/assets/arcade.png
#$(GAMESRC)/btr-logo.png

GAME=BelowTheRoot

GAMEVER=a3.1

PLATFORM=c64

WELLTUNED_FILES = $(addprefix $(GAMESRC)/,below_the_root_boot.d64 reu_data.bin)

$(GAME)-initramfs:
	cp $(GAMESRC)/init $(INITRAMFS)/init
	cp $(WELLTUNED_FILES) $(INITRAMFS)/
	cp $(GAMESRC)/vice.cfg $(INITRAMFS)/

GAMEFILES= below_the_root_1.g64 below_the_root_2.g64 \
           readme.txt legal \
           manual.txt map.jpg \
           box_front.jpg box_inside_l.jpg box_inside_r.jpg box_back.jpg

SPOILERS= walkthru.txt

# TODO:
# [c64]
#   [ ] get sound working in vice
#   [ ] get rid of dead mouse cursor
#   [ ] persist disk storage to hard disk; mkizo on exit
#   [ ] playtest game
#   [ ] credit count zero?
#   [ ] choose better joystick emu keys (can't use space as that's on the keyboard and required by the game for loading.  numpad?)
#   [ ] support a real joystick

# [btr]
#   [ ] or ask mobygames for permission to include their images (unwatermarked)

