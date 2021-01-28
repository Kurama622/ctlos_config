#!/bin/sh

usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xset b off

# xset +fp /usr/share/fonts/local &
# xset +fp /usr/share/fonts/artwiz-fonts &
# xset +fp /usr/share/fonts/misc &
# xset +fp /usr/share/fonts/bitmap &
# xset +fp ~/.fonts &
# xset fp rehash &
# fc-cache -fv &

exec bspwm
