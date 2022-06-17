#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

dbus-update-activation-environment --systemd DISPLAY
eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"
export SSH_AUTH_SOCK
export _JAVA_AWT_WM_NONREPARENTING=1

xset r rate 200 25
xsetroot -cursor_name left_ptr &
systemctl --user import-environment DISPLAY
clipmenud &
picom -f &
numlockx on &
~/.screenlayout/office_4.sh &&
  feh --bg-scale ~/Wallpapers/pixel_art.png &
blueman-applet &
exec bspwm