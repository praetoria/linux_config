PKG_XORG_EXTRA=xorg-xset xorg-xmessage xorg-setxkbmap xorg-xrandr xorg-xprop
PKG_XDRV=xf86-input-synaptics xf86-input-mouse xf86-input-keyboard xf86-input-libinput
PKG_I3=i3-wm i3status perl-anyevent-i3 dmenu xorg-server xorg-server-utils xorg-xinit xorg-xkill xorg-xrdb xorg-xmodmap feh ranger
AUR_I3=i3lock-blur
PKG_URXVT=rxvt-unicode rxvt-unicode-terminfo urxvt-perls
PKG_VMWARE=open-vm-tools xf86-video-vmware xf86-input-vmmouse gtkmm gtk2
PKG_NVIDIA=lib32-libvdpau libvdpau libxnvctrl nvidia nvidia-settings nvidia-utils
FLAGS=--noconfirm

update:
	sudo pacman -Sy

vmware: update
	sudo pacman -S ${FLAGS} ${PKG_VMWARE}
	sudo systemctl enable vmtoolsd

i3: update
	sudo pacman -S ${FLAGS} ${PKG_I3} ${PKG_URXVT} ${PKG_XDRV} ${PKG_XORG_EXTRA}
	cp config/i3/config ~/.config/local/i3/config
	cp config/.Xdefaults ~/.Xdefaults
	sudo cp config/.Xmodmap /etc/X11/xinit/.Xmodmap
	sudo cp config/xinitrc /etc/X11/xinit/xinitrc
	sudo cp config/red_sun.jpg /usr/share/misc/red_sun.jpg
	sudo cp scripts/i3-exit scripts/i3-kuake /opt/bin/


virtual: i3 vmware

host: i3
