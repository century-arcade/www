# Century Arcade

## Targeted (Virtual) Hardware Platform

* CPU (targeted to i686)
    * Floating-point
* Motherboard
  * PIIX/ICH
  * i440FX, 440BX
* Serial Port - 16450 UART
* Disk
  * IDE
  * CD-ROM/DVD-drive using an ISO image
* Standard-VGA graphics card with VESA-BIOS-Extensions
* Sound cards
  * Sound Blaster 16
  * ES1370 PCI
  * Intel HD Audio
* Network Adapters
  * Realtek 8139C+ PCI network adapter (qemu/kvm)
  * AMD PcNet PCI-II NIC (vmware)
  * Intel Pro/1000 MT NIC (vmware/kvm)
  * DEC 21041 (Virtual PC)
* USB

## a survey of emulated hardware in various hypervisors and emulators

### qemu

Besides the CPU (which is also configurable and can emulate the Intel Sandy Bridge[19]), the following devices are emulated:

* CD-ROM/DVD-drive using an ISO image
* Floppy disk
* Graphics card (Cirrus CLGD 5446 PCI VGA-card or Standard-VGA graphics card with Bochs-VESA-BIOS-Extensions - Hardware level, including all non-standard modes, and an experimental patch that can accelerate simple 3D graphics via OpenGL)
* Network card (Realtek 8139C+ PCI network adapter)
* Parallel port
* PC speaker
* PCI-ATA 
* PCI and ISA-system (i440FX host PCI bridge and PIIX3 PCI to ISA bridge)
* PS/2-mouse and -keyboard
* Serial interface
* Sound card (Sound Blaster 16, ES1370 PCI, Gravis Ultrasound, and/or Intel HD Audio[20])
* Watchdog timer (Intel 6300 ESB PCI, or iB700 ISA)
* USB-controller (Intel SB82371, UHCI)

### VMWare Workstation

* Intel 440BX chipset
* NS338 SIO
* 82093AA IOAPIC
* Proprietary VESA compatible VGA adapter
* LSI Logic LSI53c10xx SCSI controller
* LSI Logic 1068 SAS controller (Version 8+)
* BusLogic BT-958 SCSI controller
* AMD PcNet PCI-II NIC
* Intel Pro/1000 MT NIC
* SoundBlaster 16 soundcard
* ES1371 soundcard

### Virtualbox

* IDE (PIIX4 and ICH6 )
* SCSI
* SATA (ICH8M)
* SAS
* VESA-compatible custom virtual graphics-card
* AMD PCnet PCI II (Am79C970A)
* AMD PCnet-Fast III (Am79C973)
* Intel Pro/1000 MT Desktop (82540EM)
* Intel Pro/1000 MT Server (82545EM)
* Intel Pro/1000 T Server (82543GC)
* Intel HD Audio, Intel ICH AC''97 and SoundBlaster 16
* USB 1.1 controller

### Windows Virtual PC

* Intel Pentium II (32-bit) processor (but virtualizes the host processor on Windows versions) with an Intel 440BX chipset.
* Standard SVGA VESA graphics card (S3 Trio 32 PCI with 4 MB video RAM)
* System BIOS from American Megatrends (AMI).
* Creative Labs Sound Blaster 16 ISA PnP. (When Windows Vista is installed as both the host (main) and guest (virtual) operating systems, settings are synchronized with the host and audio configuration is not required.)
* DEC 21041 (DEC 21140 in newer versions) Ethernet network card.
* Programs using undocumented features of hardware, exotic timings, or unsupported opcodes may not work.

### Java PC

* NE2000 [1]
* P-ATA PIIX3 [2]
* MC146818 real-time clock
* 8237 Direct Memory Access Controller
* 8254 Interval Timer
* Intel i440FX PCI Host Bridge
* Serial Port - 16450 UART
* Floating-point unit (FPU)

### Bochs

* Cirrus Logic CL-GD5430 ISA and Cirrus Logic CL-GD5446 PCI
* Sound Blaster 16 card (ISA, no Plug & Play)
* NE2000 Ethernet[4]
* Intel 440FX PCI. Host-to-PCI bridge (PMC/DBX), PCI-to-ISA bridge, PCI IDE controller (PIIX3) are available.
* USB	Root hub and the devices mouse, tablet, keypad, disk.
