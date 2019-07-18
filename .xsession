xmodmap "/home/user/.Xmodmap"
~/bin/trackpad.sh
# controls screen temperature
# redshift -l geoclue2 &
redshift -l 51.50:-0.12 &
# don't create a new one on startup, hide all
xpad -N -h &
guake &
xscreensaver &
# only decent way with systemd apparently.
xss-lock -- xscreensaver-command -lock &
# screenshotting
shutter --min_at_startup &
fdpowermon &
exec fvwm
# exec i3
